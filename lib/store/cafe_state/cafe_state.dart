import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/store/cafe_state/actions/save_cafe_for_city.dart';
import 'package:foodie_client_template/store/cafe_state/actions/select_cafe_action.dart';
import 'package:foodie_client_template/store/cafe_state/actions/unselect_cafe_action.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';

class CafeState {
  final Cafe selectedCafe;
  final List<Cafe> cafeList;

  CafeState({
    @required this.selectedCafe,
    @required this.cafeList,
  });

  factory CafeState.initial() {
    return CafeState(
      selectedCafe: null,
      cafeList: [],
    );
  }

  CafeState copyWith({Cafe selectedCafe, List<Cafe> cafeList}) {
    return CafeState(
      selectedCafe: selectedCafe ?? this.selectedCafe,
      cafeList: cafeList ?? this.cafeList,
    );
  }

  CafeState deleteSelectedCafe() {
    return CafeState(
      selectedCafe: null,
      cafeList: cafeList,
    );
  }

  CafeState reducer(dynamic action) {
    return Reducer<CafeState>(
      actions: HashMap.from({
        SelectCafeAction: (action) => _selectCafeAction(action as SelectCafeAction),
        UnselectCafeAction: (action) => _unselectCafeAction(action as UnselectCafeAction),
        SaveCafeForCity: (action) => _saveCafeListForCity(action as SaveCafeForCity),
      }),
    ).updateState(action, this);
  }

  CafeState _saveCafeListForCity(SaveCafeForCity action) {
    return copyWith(
      cafeList: action.cafeList ?? [],
    );
  }

  CafeState _unselectCafeAction(UnselectCafeAction action) {
    return deleteSelectedCafe();
  }

  CafeState _selectCafeAction(SelectCafeAction action) {
    return copyWith(
      selectedCafe: action.cafe,
    );
  }
}
