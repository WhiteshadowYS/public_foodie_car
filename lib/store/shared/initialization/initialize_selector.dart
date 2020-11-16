import 'package:base_project_template/services/internet_connection_service/internet_connection_service.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:base_project_template/store/shared/dialog_state/dialog_selector.dart';
import 'package:base_project_template/store/shared/initialization/actions/start_initialization.dart';
import 'package:redux/redux.dart';

class InitializeSelectors {
  static void startInitialization(Store<AppState> store) {
    store.dispatch(StartInitialization());
    Future.delayed(Duration(seconds: 5)).then((value) {
      InternetConnectionService.startInternetCheck(DialogSelectors.getInternetConnectionDialogFunction(store));
    });
  }
}
