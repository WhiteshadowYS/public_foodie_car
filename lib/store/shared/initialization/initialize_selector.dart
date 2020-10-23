import 'package:my_catalog/services/internet_connection_service/internet_connection_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/initialization/actions/start_initialization.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:redux/redux.dart';

class InitializeSelectors {
  static void startInitialization(Store<AppState> store) {
    store.dispatch(StartInitialization(
      getDataFunction: StorageFunctionSelector.getDataFunction(store),
    ));
    Future.delayed(Duration(seconds: 5)).then((value) {
      InternetConnectionService.startInternetCheck(DialogSelectors.getInternetConnectionDialogFunction(store));
    });
  }
}
