import 'package:foody_client_template/store/application/app_state.dart';
import 'package:foody_client_template/store/shared/loader/loader_state.dart';
import 'package:redux/redux.dart';

class LoaderSelectors {
  static bool getValueForLoadingKey(Store<AppState> store, LoaderKey loaderKey) {
    final int index = store.state.loaderState.loaders.indexWhere((loader) => loader.loaderKey == loaderKey);

    return index != -1;
  }
}
