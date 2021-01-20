import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SelectCategoryAction extends BaseAction {
  final Category category;
  SelectCategoryAction({
    @required this.category,
  }) : super(type: 'SelectCategoryAction');
}
