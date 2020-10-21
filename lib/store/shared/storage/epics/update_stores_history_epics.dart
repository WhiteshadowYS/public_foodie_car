import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/check_update_actions/check_update_action.dart';
import 'package:my_catalog/store/shared/storage/actions/set_stores_history_action/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/subscribe_to_stores_updates_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_opened_store_id_actions/update_opened_store_id_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_stores_history_actions/do_update_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_stores_history_actions/update_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_stores_history_actions/update_stores_history_result_action.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class UpdateStoresHistoryEpics {
  static final indexEpic = combineEpics<AppState>([
    _updateStoresHistoryEpic,
    _doUpdateStoresHistoryEpic,
  ]);

  static Stream<dynamic> _updateStoresHistoryEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateStoresHistoryAction>().switchMap(
      (action) {
        return ConcatStream(
          <Stream>[
            Stream.fromIterable([
              DoUpdateStoresHistoryAction(newStoreId: action.newStoreId),
            ]),
            ZipStream(<Stream>[
              actions.whereType<UpdateStoresHistoryResultAction>(),
            ], (values) {
              final UpdateStoresHistoryResultAction nAction = values.first as UpdateStoresHistoryResultAction;

              if (nAction.history == null && nAction.history.isEmpty) {
                return ConcatEagerStream([
                  StorageMainEpic.showError('No Storage found'),
                  StorageMainEpic.changeCheckIdLoadingState(false),
                ]);
              }

              final int index = nAction.history.indexWhere((store) {
                return store.id == action.newStoreId;
              });

              if (index == null && index == -1) {
                return ConcatEagerStream([
                  StorageMainEpic.showError('No Storage found'),
                  StorageMainEpic.changeCheckIdLoadingState(false),
                ]);
              }

              return Stream.fromIterable([
                // TODO: not create epic
                UpdateOpenedStoreIdAction(id: action.newStoreId),
                SetStoresHistoryAction(storesHistory: nAction.history),
              ]);
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _doUpdateStoresHistoryEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoUpdateStoresHistoryAction>().asyncMap(
      (action) {
        return StorageRepository().getStoresHistory().then((history) {
          return UpdateStoresHistoryResultAction(history: history);
        });
      },
    );
  }
}
