import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/basket_state/actions/add_to_busket_action.dart';
import 'package:foodie_client_template/store/basket_state/actions/clear_busket_action.dart';
import 'package:foodie_client_template/store/basket_state/actions/remove_from_busket_action.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';

class BusketState {
  final List<Product> products;

  BusketState({
    @required this.products,
  });

  factory BusketState.initial() {
    return BusketState(
      products: [],
    );
  }

  BusketState copyWith({List<Product> products}) {
    return BusketState(
      products: products ?? this.products,
    );
  }

  BusketState reducer(dynamic action) {
    return Reducer<BusketState>(
      actions: HashMap.from({
        ClearBusketAction: (dynamic action) => _clearBusketAction(action as ClearBusketAction),
        AddToBusketAction: (dynamic action) => _addToBusketAction(action as AddToBusketAction),
        RemoveFromBusketAction: (dynamic action) => _removeFromBusketAction(action as RemoveFromBusketAction),
      }),
    ).updateState(action, this);
  }

  BusketState _addToBusketAction(AddToBusketAction action) {
    return copyWith(
      products: products..add(action.product),
    );
  }

  BusketState _removeFromBusketAction(RemoveFromBusketAction action) {
    final Product _product = products.firstWhere(
      (item) => item.id == action.product.id,
      orElse: () => null,
    );

    if (_product != null) {
      return copyWith(
        products: products..remove(_product),
      );
    }

    return this;
  }

  BusketState _clearBusketAction(ClearBusketAction action) {
    return copyWith(
      products: products..clear(),
    );
  }
}
