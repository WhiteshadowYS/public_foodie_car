import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/loader/actions/stop_loading_action.dart';
import 'package:my_catalog/store/shared/loader/actions/start_loading_action.dart';
import 'package:my_catalog/services/dialog_service/models/empty_loader_dialog.dart';
import 'package:my_catalog/store/shared/storage/actions/set_opened_id_actions.dart';
import 'package:my_catalog/store/shared/initialization/actions/start_initialization.dart';
import 'package:my_catalog/store/shared/storage/actions/check_id_actions/check_id_action.dart';
import 'package:my_catalog/store/shared/storage/actions/set_stores_history_actions/set_stores_history_action.dart';

// TODO(Yuri): Update comments for this class.
/// [InitializeMainEpic] the main epic which is started for initialization.
/// The class [InitializeMainEpic], has only one static variable [indexEpic].
/// The variable [indexEpic], returns a sheet of [combineEpics] that stores one epic, [_startInitializationEpic].
class InitializeMainEpic {
  static const String tag = '[InitializeEpics]';

  static final indexEpic = combineEpics<AppState>([
    _startInitializationEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// Internally, check which storage is currently selected in the [openStorageId] variable.
  /// In the [history] variable, we save all storage we were in.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  /// At the end, call the [_navigationStream] function, which makes the transition to the page, depending on what is stored in [storage].
  static Stream<dynamic> _startInitializationEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<StartInitialization>().switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      yield* _changeInitializationLoading(true);

      await Future.delayed(Duration(seconds: 1));

      final int openedStorageId = await repository.getOpenedStoreId();
      final List<SavedStorageModel> history = await repository.getStoresHistory();

      if (openedStorageId != null) {
        yield* Stream.fromIterable([
          SetOpenedStoreIdAction(id: openedStorageId),
        ]);
      }

      if (history != null && history.isNotEmpty) {
        yield* Stream.fromIterable([
          SetStoresHistoryAction(storesHistory: history, idSelect: openedStorageId),
        ]);
      }

      yield* _changeInitializationLoading(false);

      yield* _navigationStream(openedStorageId, action.getDataFunction);
    });
  }

  /// In the [_changeInitializationLoading] function, the page load status changes.
  /// Does it accept the [value] parameter, depending on which page is returned or not?
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

  /// The [_navigationStream] function performs the transition depending on what is passed in [id].
  static Stream<dynamic> _navigationStream(int id, void Function(int, int) getDataCallback) {
    if (id == null) return Stream.value(RouteSelectors.gotoMainPageAction);
    return Stream.value(
      CheckIdAction(
        id: id,
        getData: getDataCallback,
      ),
    );
  }
}
