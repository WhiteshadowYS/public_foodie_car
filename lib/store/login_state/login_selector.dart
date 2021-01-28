import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/login_state/actions/login_action.dart';
import 'package:redux/redux.dart';

abstract class LoginSelector {
  static void Function(String, String) getLoginFunction(Store<AppState> store) {
    return (email, pass) {
      store.dispatch(
        LoginAction(
          email: email,
          password: pass,
        ),
      );
    };
  }
}
