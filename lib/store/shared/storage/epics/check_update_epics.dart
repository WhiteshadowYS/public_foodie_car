import 'package:my_catalog/dictionary/dictionary_classes/error_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/dialog_service/models/internet_connection_dialog.dart';
import 'package:my_catalog/services/network_service/res/consts.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_update_actions/check_update_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_update_actions/check_update_result_action.dart';
import 'package:my_catalog/store/shared/storage/actions/check_update_actions/do_check_update_action.dart';
import 'package:my_catalog/store/shared/storage/actions/get_data_actions/get_data_action.dart';
import 'package:my_catalog/store/shared/storage/actions/reload_stores_history_actions/reload_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class CheckUpdateEpics {
  static final indexEpic = combineEpics<AppState>([
    _checkUpdateEpic,
    _doCheckUpdateEpic,
  ]);

  static Stream<dynamic> _checkUpdateEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    final ErrorDictionary dictionary = FlutterDictionary.instance.language.errorDictionary;
    return actions.whereType<CheckUpdateAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              if (action.model != null)
                DoCheckUpdateAction(
                  model: action.model,
                )
              else
                CheckUpdateResultAction(
                  isLastUpdate: true,
                ),
            ]),
            ZipStream(<Stream>[
              actions.whereType<CheckUpdateResultAction>(),
            ], (values) {
              final CheckUpdateResultAction nAction = values.first as CheckUpdateResultAction;

              if (action.error != null && action.error.statusCode != BAD_GATEWAY_STATUS_CODE) {
                return ConcatEagerStream([
                  StorageMainEpic.showError(action.error?.error ?? dictionary.errorNotFound),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              if (action.error?.statusCode == BAD_GATEWAY_STATUS_CODE) {
                return ConcatStream([
                  Stream.fromIterable([
                    ReloadStoresHistoryAction(
                      newStoreId: action.model.id,
                      error: action.error?.error ?? dictionary.errorNotFound,
                    ),
                  ]),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              if (!nAction.isLastUpdate) {
                return ConcatStream([
                  Stream.value(
                    GetDataAction(
                      id: action.model.id,
                      update: action.model.update,
                      isInitialLoad: true,
                    ),
                  ),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }
              return Stream.fromIterable([
                ReloadStoresHistoryAction(
                  error: action.error?.error ?? dictionary.errorNotFound,
                  newStoreId: action.model.id,
                ),
              ]);
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _doCheckUpdateEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoCheckUpdateAction>().asyncMap(
      (action) {
        return StorageRepository().isLastUpdate(action.model).then((response) {
          return CheckUpdateResultAction(
            isLastUpdate: response,
          );
        });
      },
    );
  }
}
