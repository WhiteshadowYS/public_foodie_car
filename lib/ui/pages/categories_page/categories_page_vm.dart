import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/data_services/categories_service.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/cafe_state/cafe_selector.dart';
import 'package:foodie_client_template/store/category_state/category_selector.dart';
import 'package:foodie_client_template/store/shared/loader/loader_selectors.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:foodie_client_template/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class CategoriesPageVM {
  final bool isLoading;
  final Cafe selectedCafe;
  final List<Category> categories;

  final void Function() getCategories;
  final void Function(Category) selectCategory;
  final void Function() gotoGallery;
  final void Function() gotoProductsPage;

  CategoriesPageVM({
    @required this.isLoading,
    @required this.categories,
    @required this.getCategories,
    @required this.selectCategory,
    @required this.selectedCafe,
    @required this.gotoProductsPage,
    @required this.gotoGallery,
  });

  static CategoriesPageVM init(Store<AppState> store) {
    return CategoriesPageVM(
      isLoading: LoaderSelectors.getValueForLoadingKey(store, LoaderKey.global),
      categories: CategorySelector.getCategories(store),
      selectedCafe: CafeSelector.getSelectedCafe(store),
      getCategories: CategorySelector.getCategoriesForCafe(store),
      selectCategory: CategorySelector.getSelectCategoryFunction(store),
      gotoProductsPage: RouteSelectors.gotoProductsPage(store),
      gotoGallery: RouteSelectors.gotoGalleryPage(store),
    );
  }
}
