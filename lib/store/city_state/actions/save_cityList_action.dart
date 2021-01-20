import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveCityListAction extends BaseAction {
  final List<City> cityList;

  SaveCityListAction({@required this.cityList}) : super(type: 'SaveCityListAction');
}
