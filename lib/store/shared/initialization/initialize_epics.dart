import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/set_opened_store_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/initialization/actions/start_initialization.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class InitializeEpics {
  static final indexEpic = combineEpics<AppState>([
    startInitializationEpic,
  ]);

  static Stream<dynamic> startInitializationEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<StartInitialization>().switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      final String openedStorageId = await repository.getOpenedStoreId();
      final List<SavedStorageModel> history = await repository.getStoresHistory();

      if (openedStorageId != null && openedStorageId != '') {
        yield* Stream.fromIterable([
          SetOpenedStoreIdAction(storeId: openedStorageId),
        ]);
      }

      if (history != null && history.isNotEmpty) {
        yield* Stream.fromIterable([
          SetStoresHistoryAction(storesHistory: history),
        ]);
      }

      yield* _homePageNavigationStream();
    });
  }

  static Stream<dynamic> _homePageNavigationStream() {
    return Stream.fromIterable([
      RouteSelectors.gotoMainPageAction,
    ]);
  }
}
