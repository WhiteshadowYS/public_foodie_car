import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/check_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:my_catalog/store/global/storage/storage_state.dart';
import 'package:redux/redux.dart';

/// [StorageSelector] - selector for all data what we save in [StorageState].
/// Methods:
///   - [getDataFunction]. It is function fot get all storage data from the server.
class StorageSelector {
  static void Function(String, int) _getData(Store<AppState> store) {
    return (String id, int update) {
      store.dispatch(
        GetDataAction(
          storageId: id,
          update: update,
        ),
      );
    };
  }

  static void Function(String) getCheckIdFunction(Store<AppState> store) {
    return (String id) {
      store.dispatch(
        CheckIdAction(
          storageId: id,
          getData: _getData(store),
        ),
      );
    };
  }

  static List<SavedStorageModel> getHistory(Store<AppState> store) {
    return store.state.storageState.storesHistory;
  }
}
