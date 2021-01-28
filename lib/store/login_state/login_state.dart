import 'dart:collection';

import 'package:foodie_car_template/store/login_state/actions/save_token_action.dart';
import 'package:foodie_car_template/store/shared/reducer.dart';

class LoginState {
  final String token;

  LoginState({
    this.token,
  });

  factory LoginState.initial() {
    return LoginState();
  }

  LoginState copyWith({String token}) {
    return LoginState(
      token: token ?? this.token,
    );
  }

  LoginState reducer(dynamic action) {
    return Reducer<LoginState>(
      actions: HashMap.from({
        SaveTokenAction: (action) => _saveTokenAction(action as SaveTokenAction),
      }),
    ).updateState(action, this);
  }

  LoginState _saveTokenAction(SaveTokenAction action) {
    return copyWith(
      token: action.token,
    );
  }
}
