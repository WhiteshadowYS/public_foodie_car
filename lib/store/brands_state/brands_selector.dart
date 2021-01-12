import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/brands_state/actions/get_brands_action.dart';
import 'package:redux/redux.dart';

abstract class BrandsSelector {
  static void Function() getBrandsFunction(Store<AppState> store) {
    return () => store.dispatch(GetBrandsAction());
  }
}
