import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/reload_stores_history_actions/reload_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_stores_history_actions/do_update_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_stores_history_actions/update_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_stores_history_actions/update_stores_history_result_action.dart';
import 'package:my_catalog/utils/empty_action.dart';
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
              DoUpdateStoresHistoryAction(
                id: action.id,
                update: action.update,
                storageModel: action.storageModel,
                locale: action.locale,
              ),
            ]),
            ZipStream(<Stream>[
              actions.whereType<UpdateStoresHistoryResultAction>(),
            ], (values) {
              return Stream.value(
                ReloadStoresHistoryAction(newStoreId: action.id),
              );
            }).switchMap((action) => action),
          ],
        );
      },
    );
  }

  static Stream<dynamic> _doUpdateStoresHistoryEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<DoUpdateStoresHistoryAction>().asyncMap(
      (action) async {
        await StorageRepository().updateStoresHistory(
          id: action.id,
          update: action.update,
          storageModel: action.storageModel,
          locale: action.locale,
        );

        return EmptyAction();
      },
    );
  }
}
