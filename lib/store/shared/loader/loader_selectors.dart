import 'package:foodie_client_template/domain/functional_services/dialog_service/interfaces/i_loader.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:redux/redux.dart';

class LoaderSelectors {
  static List<ILoader> getLoaders(Store<AppState> store) {
    return store.state.loaderState.loaders;
  }

  static bool getValueForLoadingKey(Store<AppState> store, LoaderKey loaderKey) {
    final int index = store.state.loaderState.loaders.indexWhere((loader) => loader.loaderKey == loaderKey);

    return index != -1;
  }
}
