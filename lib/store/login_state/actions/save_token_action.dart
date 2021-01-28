import 'package:flutter/material.dart';
import 'package:foodie_car_template/store/shared/base_action.dart';

class SaveTokenAction extends BaseAction {
  final String token;

  SaveTokenAction({
    @required this.token,
  }) : super(type: 'SaveTokenAction');
}
