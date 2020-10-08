import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';
import 'package:redux/redux.dart';

class LoaderSelectors {
  static bool getValueForLoadingKey(Store<AppState> store, LoaderKey loaderKey) {
    final int index = store.state.loaderState.loaders.indexWhere((loader) => loader.loaderKey == loaderKey);

    return index != -1;
  }
}
