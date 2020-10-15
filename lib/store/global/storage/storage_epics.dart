import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/dialog_service/models/empty_loader_dialog.dart';
import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
import 'package:my_catalog/services/firebase_service/firebase_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/check_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:my_catalog/store/global/storage/actions/open_storage_action.dart';
import 'package:my_catalog/store/global/storage/actions/remove_opened_storage_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_stores_history_action.dart';
import 'package:my_catalog/store/global/storage/actions/update_language_action.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:my_catalog/store/shared/loader/actions/start_loading_action.dart';
import 'package:my_catalog/store/shared/loader/actions/stop_loading_action.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class StorageEpics {
  static final indexEpic = combineEpics<AppState>([
    _checkIdEpic,
    _getDataEpic,
    _openStorageEpic,
    _removeOpenedStorageEpic,
    _updateLanguageEpic,
  ]);

  static bool _idValidation(CheckIdAction action) => action.id != null;

  static bool _id2Validation(GetDataAction action) => action.id != null;

  static Stream<dynamic> _checkIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<CheckIdAction>().where(_idValidation).switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      yield* _changeCheckIdLoadingState(true);

      final BaseHttpResponse<StorageStatusModel> response = await repository.getStorageStatus(id: action.id);

      if (response.error != null || response.response == null) {
        yield* _showError(response.error?.error ?? 'Error not found');
        return;
      }

      final bool isLastUpdate = await repository.isLastUpdate(response.response);

      FirebaseService.instance.listenChanges(action.id, action.getData);

      if (!isLastUpdate) {
        yield* Stream.value(GetDataAction(
          id: response.response.id,
          update: response.response.update,
        ));
        return;
      }

      final List<SavedStorageModel> history = await repository.getStoresHistory();

      if (history == null && history.isEmpty) {
        yield* ConcatEagerStream([
          _showError('No Storage found'),
          _changeCheckIdLoadingState(false),
        ]);
        return;
      }

      await repository.updateOpenedStoreId(id: action.id);

      final int index = history.indexWhere((store) {
        return store.id == action.id;
      });

      if (index == null && index == -1) {
        yield* ConcatEagerStream([
          _showError('No Storage found'),
          _changeCheckIdLoadingState(false),
        ]);
        return;
      }

      yield* ConcatEagerStream([
        Stream.fromIterable([
          SetStoresHistoryAction(storesHistory: history),
          OpenStorageAction(
            id: action.id,
            storage: history[index].storage,
          ),
        ]),
        _changeCheckIdLoadingState(false),
      ]);
    });
  }

  static Stream<dynamic> _getDataEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetDataAction>().where(_id2Validation).switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      final List<SavedStorageModel> oHistory = await repository.getStoresHistory();

      final int index = oHistory?.indexWhere((element) {
        return element.id == action.id;
      });

      if (oHistory != null && oHistory.isNotEmpty && oHistory[index].update >= action.update) {
        logger.d('action.update: ${action.update}, history[index].update: ${oHistory[index].update}');
        return;
      }

      final BaseHttpResponse<StorageModel> response = await repository.getStorageData(id: action.id);

      await repository.updateStoresHistory(
        id: action.id,
        locale: '',
        storageModel: response.response,
        update: action.update,
      );
      await repository.updateOpenedStoreId(id: action.id);

      final List<SavedStorageModel> history = await repository.getStoresHistory();

      if (history != null && history.isNotEmpty) {
        yield* Stream.fromIterable([
          SetStoresHistoryAction(storesHistory: history),
          OpenStorageAction(
            id: action.id,
            storage: response.response,
          ),
        ]);
      }
    });
  }

  static Stream<dynamic> _updateLanguageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<UpdateLanguageAction>().switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      await repository.updateStoresHistory(
        id: action.newModel.id,
        locale: action.newModel.locale,
        storageModel: action.newModel.storage,
        update: action.newModel.update,
      );

      return;
    });
  }

  static Stream<dynamic> _openStorageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<OpenStorageAction>().switchMap((action) {
      final String lastRoute = RouteService.instance.currentRoute;

      if (lastRoute == Routes.main || lastRoute == null) {
        return Stream.value(RouteSelectors.gotoCatalogsPageAction);
      }

      return Stream.empty();
    });
  }

  static Stream<dynamic> _removeOpenedStorageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RemoveOpenedStorageAction>().switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      await repository.removeOpenedStoreId();
      return;
    });
  }

  static Stream<dynamic> _showError(String errorText) {
    return Stream.value(
      ShowDialogAction(
        dialog: ErrorDialog(
          message: errorText,
        ),
      ),
    );
  }

  static Stream<dynamic> _changeCheckIdLoadingState(bool value) {
    if (value) {
      return Stream.value(StartLoadingAction(
        loader: EmptyLoaderDialog(
          state: true,
          loaderKey: LoaderKey.checkIdLoading,
        ),
      ));
    }

    return Stream.value(StopLoadingAction(
      loaderKey: LoaderKey.checkIdLoading,
    ));
  }
}
