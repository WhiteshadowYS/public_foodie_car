import 'package:redux/redux.dart';

import 'package:my_catalog/store/application/app_state.dart';

import 'package:my_catalog/store/shared/initialization/actions/start_initialization.dart';

class InitializeSelectors {
  static void startInitialization(Store<AppState> store) {
    return store.dispatch(StartInitialization())();
  }
}
