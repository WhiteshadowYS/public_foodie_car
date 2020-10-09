import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/check_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:my_catalog/store/global/storage/storage_state.dart';
import 'package:redux/redux.dart';

/// [StorageSelector] - selector for all data what we save in [StorageState].
/// Methods:
///   - [getDataFunction]. It is function fot get all storage data from the server.
class StorageSelector {
  static void Function(String id) getCheckIdFunction(Store<AppState> store) {
    return (String id) => store.dispatch(CheckIdAction(storageId: id));
  }
}
