import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:foodie_client_template/store/city_state/actions/save_cityList_action.dart';
import 'package:foodie_client_template/store/city_state/actions/save_city_action.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';

class CityState {
  final City selectedCity;
  final List<City> cityList;

  CityState({
    @required this.selectedCity,
    @required this.cityList,
  });

  factory CityState.initial() {
    return CityState(
      selectedCity: null,
      cityList: [],
    );
  }

  CityState copyWith({List<City> cityList, City selectedCity}) {
    return CityState(
      selectedCity: selectedCity,
      cityList: cityList ?? this.cityList,
    );
  }

  CityState reducer(dynamic action) {
    return Reducer<CityState>(
      actions: HashMap.from({
        SaveCityListAction: (action) => _saveCityListAction(action as SaveCityListAction),
        SaveCityAction: (action) => _saveCityAction(action as SaveCityAction),
      }),
    ).updateState(action, this);
  }

  CityState _saveCityAction(SaveCityAction action) {
    return copyWith(selectedCity: action?.city);
  }

  CityState _saveCityListAction(SaveCityListAction action) {
    return copyWith(cityList: action?.cityList ?? []);
  }
}
