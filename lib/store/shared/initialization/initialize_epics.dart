import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/set_opened_store_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/initialization/actions/end_initialization.dart';
import 'package:my_catalog/store/shared/initialization/actions/get_opened_store_id_action.dart';
import 'package:my_catalog/store/shared/initialization/actions/get_stores_history_action.dart';
import 'package:my_catalog/store/shared/initialization/actions/start_initialization.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/utils/empty_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class InitializeEpics {
  static final indexEpic = combineEpics<AppState>([
    startInitializationEpic,
    getOpenedStoreIdEpic,
    getStoresHistoryEpic,
  ]);

  static Stream<dynamic> startInitializationEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    // Stream.fromIterable([GetStoresHistoryAction()]),
    return actions.whereType<StartInitialization>().switchMap((action) {
      return ConcatStream([
        Stream.fromIterable([
          GetOpenedStoreIdAction(),
          GetStoresHistoryAction(),
          EndInitializationAction(),
        ]),
        ZipStream([
          actions.where((event) {
            final bool e3 = event.runtimeType == EndInitializationAction;

            return e3;
          }),
        ], (values) {
          print('values: $values');
          return RouteSelectors.gotoMainPageAction;
        }),
      ]);
    });
  }

  static Stream<dynamic> getOpenedStoreIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetOpenedStoreIdAction>().switchMap((action) {
      return Stream.fromFuture(
        StorageRepository().getOpenedStoreId().then((String openedStoreId) {
          if (openedStoreId == null || openedStoreId == '') return EmptyAction();

          return SetOpenedStoreIdAction(
            storeId: openedStoreId,
          );
        }),
      );
    });
  }

  static Stream<dynamic> getStoresHistoryEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetStoresHistoryAction>().switchMap((action) {
      return Stream.fromFuture(
        StorageRepository().getStoresHistory().then((List<SavedStorageModel> history) {
          if (history == null || history.isEmpty) return EmptyAction();

          return SetStoresHistoryAction(
            storesHistory: history,
          );
        }),
      );
    });
  }
}

// Future.delayed(Duration(seconds: 3)).then((_) {
//   NavigateToAction action = RouteSelectors.gotoMainPageAction;
//
//   print('action: $action');
//
//   return action;
// }),
// );Stream.fromIterable([RouteSelectors.gotoMainPageAction])
