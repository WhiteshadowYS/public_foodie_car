import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/dialog_service/models/empty_loader_dialog.dart';
import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
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
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class StorageEpics {
  static final indexEpic = combineEpics<AppState>([
    getDataEpic,
    checkIdEpic,
  ]);

  static bool _idValidation(CheckIdAction action) => action.storageId != null && action.storageId != '';

  static bool _id2Validation(GetDataAction action) => action.storageId != null && action.storageId != '';

  static Stream<dynamic> checkIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<CheckIdAction>().where(_idValidation).switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      yield* _changeCheckIdLoadingState(true);

      final BaseHttpResponse<StorageStatusModel> response = await repository.getStorageStatus(storageId: action.storageId);

      if (response.error != null) {
        yield* Stream.value(
          ShowDialogAction(
            dialog: ErrorDialog(
              title: 'title',
              message: 'message',
            ),
          ),
        );
      } else {
        final bool isLastUpdate = await repository.isLastUpdate(response.response);

        if (!isLastUpdate) {
          yield* Stream.value(GetDataAction(storageId: response.response.id));
        }
      }

      yield* _changeCheckIdLoadingState(false);
    });
  }

  static Stream<dynamic> getDataEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetDataAction>().where(_id2Validation).switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      final BaseHttpResponse<StorageModel> response = await repository.getStorageData(storageId: action.storageId);

      await repository.updateStoresHistory(id: action.storageId, locale: '', storageModel: response.response);
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
