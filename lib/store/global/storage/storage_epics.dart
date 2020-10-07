import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/repositories/storage_repository.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/check_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class StorageEpics {
  static final indexEpic = combineEpics<AppState>([
    getDataEpic,
    checkIdEpic,
  ]);

  static Stream<dynamic> checkIdEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<CheckIdAction>().where(
      (CheckIdAction action) {
        return action.storageId != null && action.storageId != '';
      },
    ).switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      // change loading



      final BaseHttpResponse<StorageStatusModel> response = await repository.getStorageStatus(storageId: action.storageId);
      print('Status model: ${response.response.toJson()}');

      final List<SavedStorageModel> history = store.state.storageState.storesHistory;

      if (response.error != null) {
        // return
      } else {
        for (SavedStorageModel storageModel in history) {
          final bool idCheck = storageModel.id == response.response.id;
          final bool lastUpdateCheck = storageModel.storage.lastUpdate < response.response.lastUpdate;

          if (idCheck && lastUpdateCheck) {
            // GetData() by id;
            // UpdateSavedStorageModel() by id and with new lastUpdate value; (in localStorage and AppState)
          }
        }

        // OpenStorage() in AppState
        // SetOpenedStorageId() in AppState
      }

      // change loading
    });
  }

  static Stream<dynamic> getDataEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetDataAction>().switchMap((action) async* {
      final StorageRepository repository = StorageRepository();

      final BaseHttpResponse<StorageModel> response = await repository.getStorageData(storageId: store.state.storageState.openedStoreId);
    });
  }
}
