import 'package:flutter/material.dart';
import 'package:foodie_car_template/store/shared/base_action.dart';

class LoginAction extends BaseAction {
  final String email;
  final String password;

  LoginAction({
    @required this.email,
    @required this.password,
  }) : super(type: 'LoginAction');
}
