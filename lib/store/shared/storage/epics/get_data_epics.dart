import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/locales.dart';
import 'package:my_catalog/services/dialog_service/models/default_loader_dialog.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/loader/actions/start_loading_action.dart';
import 'package:my_catalog/store/shared/loader/actions/stop_loading_action.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';
import 'package:my_catalog/store/shared/storage/actions/get_data_actions/do_get_data_action.dart';
import 'package:my_catalog/store/shared/storage/actions/get_data_actions/get_data_action.dart';
import 'package:my_catalog/store/shared/storage/actions/get_data_actions/get_data_result_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/update_language_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_stores_history_actions/update_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class GetDataEpics {
  static final indexEpic = combineEpics<AppState>([
    _getDataEpic,
    _doGetDataEpic,
  ]);

  static Stream<dynamic> _getDataEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetDataAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              StartLoadingAction(
                loader: DefaultLoaderDialog(
                  state: true,
                  loaderKey: LoaderKey.getData,
                ),
              ),
              DoGetDataAction(
                id: action.id,
                update: action.update,
              ),
            ]),
            ZipStream(<Stream>[
              actions.whereType<GetDataResultAction>(),
            ], (values) {
              final GetDataResultAction nAction = values.first as GetDataResultAction;

              if (nAction.response?.error != null) {
                return ConcatEagerStream([
                  Stream.value(
                    StopLoadingAction(
                      loaderKey: LoaderKey.getData,
                    ),
                  ),
                  StorageMainEpic.showError(nAction.response?.error?.error ?? 'Unknown error'),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              final List<LanguageModel> languages = nAction.response.response.settings.languages;

              int index = languages.indexWhere((element) {
                return element.isDefault;
              });

              if (index == null || index == -1) {
                index = languages.indexWhere((element) {
                  return element.code == Locales.base.toUpperCase();
                });
              }

              return Stream.fromIterable([
                StopLoadingAction(
                  loaderKey: LoaderKey.getData,
                ),
                UpdateStoresHistoryAction(
                  id: action.id,
                  update: action.update,
                  storageModel: nAction.response.response,
                ),
                if (index != null && index != -1 && action.isInitialLoad)
                  UpdateLanguageAction(
                    newModel: SavedStorageModel(
                      id: action.id,
                      update: action.update,
                      storage: nAction.response.response,
                      locale: languages[index].code ?? '',
                    ),
                  ),
              ]);
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _doGetDataEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoGetDataAction>().asyncMap(
      (action) async {
        final StorageRepository repository = StorageRepository();

        final List<SavedStorageModel> oHistory = await repository.getStoresHistory();

        final int oIndex = oHistory?.indexWhere((element) {
          return element.id == action.id;
        });

        if (oIndex != -1 && oHistory != null && oHistory.isNotEmpty && oHistory[oIndex].update >= action.update) {
          logger.d('action.update: ${action.update}, history[index].update: ${oHistory[oIndex].update}');
          return EmptyAction();
        }

        return GetDataResultAction(
          response: await repository.getStorageData(id: action.id),
        );
      },
    );
  }
}
