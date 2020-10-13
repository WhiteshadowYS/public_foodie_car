import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/dialog_service/models/empty_loader_dialog.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/check_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_opened_store_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/initialization/actions/start_initialization.dart';
import 'package:my_catalog/store/shared/loader/actions/start_loading_action.dart';
import 'package:my_catalog/store/shared/loader/actions/stop_loading_action.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class InitializeEpics {
  static const String tag = '[InitializeEpics]';

  static final indexEpic = combineEpics<AppState>([
    startInitializationEpic,
  ]);

  static Stream<dynamic> startInitializationEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<StartInitialization>().switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      yield* _changeInitializationLoading(true);

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

      yield* _changeInitializationLoading(false);

      yield* _navigationStream(openedStorageId);
    });
  }

  static Stream<dynamic> _changeInitializationLoading(bool value) {
    if (value) {
      return Stream.value(StartLoadingAction(
        loader: EmptyLoaderDialog(
          state: true,
          loaderKey: LoaderKey.initializationLoading,
        ),
      ));
    }

    return Stream.value(StopLoadingAction(
      loaderKey: LoaderKey.initializationLoading,
    ));
  }

  static Stream<dynamic> _navigationStream(String id) {
    if (id == null) return Stream.value(RouteSelectors.gotoMainPageAction);

    return Stream.value(CheckIdAction(storageId: id));
  }
}
