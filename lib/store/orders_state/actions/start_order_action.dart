import 'package:flutter/material.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:foodie_car_template/store/shared/base_action.dart';

class StartOrderAction extends BaseAction {
  final Order order;

  StartOrderAction({
    @required this.order,
  }) : super(type: 'StartOrderAction');
}
