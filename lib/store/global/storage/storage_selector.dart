import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:redux/redux.dart';

class StorageSelector {
  static void Function() getDataFunction(Store<AppState> store) {
    return () => store.dispatch(GetDataAction());
  }
}