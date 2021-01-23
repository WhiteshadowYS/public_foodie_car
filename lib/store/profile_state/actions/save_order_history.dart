import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/order/order.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveOrderHistory extends BaseAction {
  final List<Order> orders;

  SaveOrderHistory({
    @required this.orders,
  }) : super(type: 'SaveOrderHistory');
}
