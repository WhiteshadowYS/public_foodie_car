import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveCityAction extends BaseAction {
  final City city;

  SaveCityAction({@required this.city}) : super(type: 'SaveCityAction');
}
