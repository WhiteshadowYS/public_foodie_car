import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class AddToBusketAction extends BaseAction {
  final Product product;
  AddToBusketAction({
    @required this.product,
  }) : super(type: 'AddToBusketAction');
}
