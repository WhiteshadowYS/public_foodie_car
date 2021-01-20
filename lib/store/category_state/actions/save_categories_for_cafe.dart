import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveCategoriesForCafe extends BaseAction {
  final List<Category> categories;

  SaveCategoriesForCafe({
    @required this.categories,
  }) : super(type: 'SaveCategoriesForCafe');
}
