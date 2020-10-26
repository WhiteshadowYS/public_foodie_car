import 'package:my_catalog/dictionary/dictionary_classes/error_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/check_terms_actions/check_terms_action.dart';
import 'package:my_catalog/store/shared/storage/actions/reload_stores_history_actions/do_reload_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/reload_stores_history_actions/reload_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/reload_stores_history_actions/reload_stores_history_result_action.dart';
import 'package:my_catalog/store/shared/storage/actions/set_stores_history_actions/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_opened_store_id_actions/update_opened_store_id_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class ReloadStoresHistoryEpics {
  static final indexEpic = combineEpics<AppState>([
    _reloadStoresHistoryEpic,
    _doReloadStoresHistoryEpic,
  ]);

  static Stream<dynamic> _reloadStoresHistoryEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ReloadStoresHistoryAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              DoReloadStoresHistoryAction(newStoreId: action.newStoreId),
            ]),
            ZipStream(<Stream>[
              actions.whereType<ReloadStoresHistoryResultAction>(),
            ], (values) {
              final ReloadStoresHistoryResultAction nAction = values.first as ReloadStoresHistoryResultAction;

              if (nAction.history == null && nAction.history.isEmpty) {
                return ConcatEagerStream([
                  StorageMainEpic.showError(action.error),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              final int index = nAction.history.indexWhere((store) {
                return store.id == action.newStoreId;
              });

              if (index == null || index == -1) {
                return ConcatEagerStream([
                  StorageMainEpic.showError(action.error),
                  StorageMainEpic.changeCheckIdLoadingState(value: false),
                ]);
              }

              return Stream.fromIterable([
                UpdateOpenedStoreIdAction(id: action.newStoreId),
                SetStoresHistoryAction(storesHistory: nAction.history),
                CheckTermsAction(
                  id: action.newStoreId,
                  model: nAction.history[index],
                ),
              ]);
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _doReloadStoresHistoryEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoReloadStoresHistoryAction>().asyncMap(
      (action) {
        return StorageRepository().getStoresHistory().then((history) {
          return ReloadStoresHistoryResultAction(history: history);
        });
      },
    );
  }
}
