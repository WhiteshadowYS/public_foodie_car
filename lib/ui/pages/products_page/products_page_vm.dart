import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_product_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class ProductsPageVM {
  final void Function(int) navigateToSingleProductPagePage;
  final ProductModel Function(int) getCurrentProductData;
  final List<InfoProductModel> products;
  final String currentLocale;

  const ProductsPageVM({
    @required this.navigateToSingleProductPagePage,
    @required this.getCurrentProductData,
    @required this.currentLocale,
    @required this.products,
  });

  static ProductsPageVM fromStore(Store<AppState> store) {
    return ProductsPageVM(
      navigateToSingleProductPagePage: RouteSelectors.gotoSingleProductPage(store),
      currentLocale: StorageSelector.getSelectedLocale(store),
      products: StorageSelector.getInfoProducts(store),
      getCurrentProductData: StorageSelector.getCurrentProductModelFunction(store),
    );
  }
}
