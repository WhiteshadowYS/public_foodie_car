import 'package:flutter/material.dart';
import 'package:foodie_car_template/store/orders_state/orders_state.dart';
import 'package:foodie_car_template/store/shared/base_action.dart';

class ChangeOrderMenuStateAction extends BaseAction {
  final OrdersMenuState menuState;

  ChangeOrderMenuStateAction({
    @required this.menuState,
  }) : super(type: 'ChangeOrderMenuStateAction');
}
