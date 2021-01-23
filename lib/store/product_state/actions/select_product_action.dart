import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SelectProductAction extends BaseAction {
  final Product product;
  SelectProductAction({
    @required this.product,
  }) : super(type: 'SelectProductAction');
}