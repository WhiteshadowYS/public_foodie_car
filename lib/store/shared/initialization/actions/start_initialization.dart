import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class StartInitialization extends BaseAction {
  final void Function(String) selectLanguageFunction;
  final void Function(City city) selectCityFunction;
  final void Function(List<City> city) saveCityListFunction;

  StartInitialization({
    @required this.selectLanguageFunction,
    @required this.selectCityFunction,
    @required this.saveCityListFunction,
  }) : super(type: 'StartInitialization');
}
