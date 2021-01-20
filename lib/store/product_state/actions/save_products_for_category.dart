import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveProductsForCategory extends BaseAction {
  final List<Product> products;
  SaveProductsForCategory({
    @required this.products,
  }) : super(type: 'SaveProductsForCategory');
}
