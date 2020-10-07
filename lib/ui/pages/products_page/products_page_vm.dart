import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class ProductsPageVM {
  final void Function() navigateToSingleProductPagePage;
  final void Function(int id) selectProduct;
  final List<ProductModel> products;

  const ProductsPageVM({
    @required this.navigateToSingleProductPagePage,
    @required this.selectProduct,
    @required this.products,
  });

  static ProductsPageVM fromStore(Store<AppState> store) {
    return ProductsPageVM(
      navigateToSingleProductPagePage: RouteSelectors.gotoSingleProductPage(store),
      // TODO(Daniil): Use selectors for this
      selectProduct: (int i) => null ,
      products: dummyProducts,
    );
  }


}
