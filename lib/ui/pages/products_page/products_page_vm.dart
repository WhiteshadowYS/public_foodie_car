import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_product_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

///[ProductsPageVM] view model for ProductsPage
///[products] - list with products which is taken from [StorageDataSelector.getInfoProducts].
///[currentLocale] - string with current locale which is taken from [StorageLanguageSelector.getSelectedLocale].
///[navigateToSingleProductPagePage] - void function with int param for navigation to Single Product Page which is taken from [RouteSelectors.gotoSingleProductPage].
///[productsPageTitle] - void function with string param for getting products page title text from [StorageLanguageSelector.getProductsTitleText].
///[backButtonText] - void function with string param for getting text for back button from [StorageLanguageSelector.getBackButtonText].
///[getCurrentProductData] - this function return [ProductModel] and takes the int param. This function is taken from [StorageFunctionSelector.getCurrentProductModelFunction].

class ProductsPageVM {
  final TextDirection textDirection;
  final String currentLocale;
  final List<InfoProductModel> products;

  final void Function(int) navigateToSingleProductPagePage;
  final String Function(String) productsPageTitle;
  final String Function(String) backButtonText;
  final ProductModel Function(int) getCurrentProductData;

  const ProductsPageVM({
    @required this.products,
    @required this.textDirection,
    @required this.currentLocale,
    @required this.backButtonText,
    @required this.productsPageTitle,
    @required this.getCurrentProductData,
    @required this.navigateToSingleProductPagePage,
  });

  static ProductsPageVM fromStore(Store<AppState> store) {
    return ProductsPageVM(
      /// StorageDataSelector
      products: StorageDataSelector.getInfoProducts(store),

      /// StorageLanguageSelector
      textDirection: StorageLanguageSelector.selectedLocaleDirection(store),
      currentLocale: StorageLanguageSelector.getSelectedLocale(store),
      backButtonText: StorageLanguageSelector.getBackButtonText(store),
      productsPageTitle: StorageLanguageSelector.getProductsTitleText(store),

      /// StorageFunctionSelector
      getCurrentProductData: StorageFunctionSelector.getCurrentProductModelFunction(store),

      /// Another
      navigateToSingleProductPagePage: RouteSelectors.gotoSingleProductPage(store),
    );
  }
}
