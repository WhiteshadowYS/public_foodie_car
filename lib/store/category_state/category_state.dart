import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/store/category_state/actions/save_categories_for_cafe.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/store/category_state/actions/select_category_action.dart';
import 'package:foodie_client_template/store/category_state/actions/unselect_category_action.dart';

class CategoryState {
  final Category selectedCategory;
  final List<Category> categories;

  CategoryState({
    @required this.selectedCategory,
    @required this.categories,
  });

  factory CategoryState.initial() {
    return CategoryState(
      selectedCategory: null,
      categories: [],
    );
  }

  CategoryState copyWith({Category selectedCategory, List<Category> categories}) {
    return CategoryState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
    );
  }

  CategoryState deleteselectedCategory() {
    return CategoryState(
      selectedCategory: null,
      categories: categories,
    );
  }

  CategoryState reducer(dynamic action) {
    return Reducer<CategoryState>(
      actions: HashMap.from({
        SelectCategoryAction: (action) => _selectCategoryAction(action as SelectCategoryAction),
        UnselectCategoryAction: (action) => _unselectCategoryAction(action as UnselectCategoryAction),
        SaveCategoriesForCafe: (action) => _saveCategoriesForCafe(action as SaveCategoriesForCafe),
      }),
    ).updateState(action, this);
  }

  CategoryState _saveCategoriesForCafe(SaveCategoriesForCafe action) {
    return copyWith(
      categories: action.categories ?? [],
    );
  }

  CategoryState _unselectCategoryAction(UnselectCategoryAction action) {
    return deleteselectedCategory();
  }

  CategoryState _selectCategoryAction(SelectCategoryAction action) {
    return copyWith(
      selectedCategory: action.category,
    );
  }
}
