import 'package:flutter/material.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/login_state/login_selector.dart';
import 'package:foodie_car_template/store/shared/loader/loader_selectors.dart';
import 'package:foodie_car_template/store/shared/loader/loader_state.dart';
import 'package:redux/redux.dart';

class LoginPageVM {
  final bool isLoading;
  final void Function(String, String) login;

  const LoginPageVM({
    @required this.isLoading,
    @required this.login,
  });

  static LoginPageVM init(Store<AppState> store) {
    return LoginPageVM(
      isLoading: LoaderSelectors.getValueForLoadingKey(store, LoaderKey.global),
      login: LoginSelector.getLoginFunction(store),
    );
  }
}
