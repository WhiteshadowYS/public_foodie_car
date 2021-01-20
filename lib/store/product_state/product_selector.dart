import 'package:foodie_client_template/store/product_state/actions/get_products_for_category.dart';
import 'package:foodie_client_template/store/product_state/actions/unselect_product_action.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/product_state/actions/select_product_action.dart';

abstract class ProductSelector {
  static List<Product> getProducts(Store<AppState> store) {
    return store.state.productState?.products ?? [];
  }

  static Product getSelectedProduct(Store<AppState> store) {
    return store.state.productState.selectedProduct;
  }

  static void Function() getProductsForCategory(Store<AppState> store) {
    return () => store.dispatch(GetProductsForCategory());
  }

  static void Function() getUnselectProductFunction(Store<AppState> store) {
    return () => store.dispatch(UnselectProductAction());
  }

  static void Function(Product) getSelectProductFunction(Store<AppState> store) {
    return (Product product) {
      store.dispatch(
        SelectProductAction(
          product: product,
        ),
      );
    };
  }
}
