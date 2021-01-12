import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/brand/brand.dart';
import 'package:foodie_client_template/store/brands_state/actions/save_brands_action.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';

class BrandsState {
  final List<Brand> brands;

  BrandsState({
    @required this.brands,
  });

  factory BrandsState.initial() {
    return BrandsState(
      brands: [],
    );
  }

  BrandsState copyWith({List<Brand> brands}) {
    return BrandsState(
      brands: brands ?? this.brands,
    );
  }

  BrandsState reducer(dynamic action) {
    return Reducer<BrandsState>(
      actions: HashMap.from({}),
    ).updateState(action, this);
  }
}
