import 'package:my_catalog/store/application/app_state.dart';
import 'package:redux/redux.dart';

import 'storage_id_text_field_actions.dart';

/// [StorageIdTextFieldSelector] - selector for all data what we save in [StorageIdTextFieldState].
/// Methods:
///   - [setIdCatalogFunction]. This is the function that saves the variable [id], in the variable [storageId].
class StorageIdTextFieldSelector {
  static void Function(String id) setIdCatalogFunction(Store<AppState> store) {
    return (String id) => store.dispatch(SaveIdCatalogAction(id: id));
  }

  static String getCatalogId(Store<AppState> store) {
    return store.state.storageIdTextFieldState.storageId;
  }

}