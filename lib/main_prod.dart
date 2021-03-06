import 'package:foodie_car_template/dependency/injection_config.dart';
import 'package:foodie_car_template/application/application.dart';
import 'package:foodie_car_template/dependency/init_system.dart';
import 'package:foodie_car_template/dependency/init_store.dart';
import 'package:foodie_car_template/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() {
  final Store _store = initStore();

  initSystem();
  initLogger(ProdConfig());
  initDependencies(ProdConfig());

  runApp(Application(store: _store));
}
