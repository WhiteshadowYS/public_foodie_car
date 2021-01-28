import 'package:flutter/material.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:foodie_car_template/store/shared/base_action.dart';

class CloseOrderAction extends BaseAction {
  final Order order;

  CloseOrderAction({
    @required this.order,
  }) : super(type: 'CloseOrderAction');
}
