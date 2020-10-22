import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
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
    return actions.whereType<CheckUpdateAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              DoCheckUpdateAction(model: action.model),
            ]),
            ZipStream(<Stream>[
              actions.whereType<CheckUpdateResultAction>(),
            ], (values) {
              final CheckUpdateResultAction nAction = values.first as CheckUpdateResultAction;

              if (!nAction.isLastUpdate) {
                return ConcatStream([
                  Stream.value(
                    GetDataAction(
                      id: action.model.id,
                      update: action.model.update,
                    ),
                  ),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              return Stream.fromIterable([
                ReloadStoresHistoryAction(
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
