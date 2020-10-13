import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/dialog_service/models/empty_loader_dialog.dart';
import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
import 'package:my_catalog/services/firebase_service/firebase_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/check_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:my_catalog/store/global/storage/actions/open_storage_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_stores_history_action.dart';
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
  ]);

  static bool _idValidation(CheckIdAction action) => action.storageId != null && action.storageId != '';

  static bool _id2Validation(GetDataAction action) => action.storageId != null && action.storageId != '';

  static Stream<dynamic> _checkIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<CheckIdAction>().where(_idValidation).switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      yield* _changeCheckIdLoadingState(true);

      final BaseHttpResponse<StorageStatusModel> response = await repository.getStorageStatus(storageId: action.storageId);

      if (response.error != null || response.response == null) {
        yield* _showError(response.error?.error ?? 'Error not found');
        return;
      }

      final bool isLastUpdate = await repository.isLastUpdate(response.response);

      FirebaseService.instance.listenChanges(action.storageId, action.getData);

      if (!isLastUpdate) {
        print('get data');
        yield* Stream.value(GetDataAction(
          storageId: response.response.id,
          update: response.response.update.toInt(),
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

      await repository.updateOpenedStoreId(id: action.storageId);

      final int index = history.indexWhere((store) {
        return store.id == action.storageId;
      });

      if (index == null && index == -1) {
        yield* ConcatEagerStream([
          _showError('No Storage found'),
          _changeCheckIdLoadingState(false),
        ]);
        return;
      }

      print('before SetStoresHistoryAction');

      yield* ConcatEagerStream([
        Stream.fromIterable([
          SetStoresHistoryAction(storesHistory: history),
          OpenStorageAction(
            id: action.storageId,
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

      final BaseHttpResponse<StorageModel> response = await repository.getStorageData(storageId: action.storageId);

      await repository.updateStoresHistory(
        id: action.storageId,
        locale: '',
        storageModel: response.response,
        update: action.update,
      );
      await repository.updateOpenedStoreId(id: action.storageId);

      final List<SavedStorageModel> history = await repository.getStoresHistory();

      if (history != null && history.isNotEmpty) {
        yield* Stream.fromIterable([
          SetStoresHistoryAction(storesHistory: history),
          OpenStorageAction(
            id: action.storageId,
            storage: response.response,
          ),
        ]);
      }
    });
  }

  static Stream<dynamic> _openStorageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<OpenStorageAction>().switchMap((action) {
      return Stream.value(RouteSelectors.gotoCatalogsPageAction);
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
