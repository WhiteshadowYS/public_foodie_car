import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/basket_state/busket_selector.dart';
import 'package:foodie_client_template/store/product_state/product_selector.dart';
import 'package:foodie_client_template/store/shared/language_state/language_selector.dart';
import 'package:foodie_client_template/store/shared/loader/loader_selectors.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:foodie_client_template/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class ProductsPageVM {
  final bool isLoading;
  final String locale;
  final List<Product> products;

  final void Function(Product) addToBusket;
  final void Function(Product) selectProduct;
  final void Function() gotoProductPage;
  final void Function() getProducts;

  const ProductsPageVM({
    this.isLoading,
    this.locale,
    this.products,
    this.addToBusket,
    this.selectProduct,
    this.gotoProductPage,
    this.getProducts,
  });

  static ProductsPageVM init(Store<AppState> store) {
    return ProductsPageVM(
      isLoading: LoaderSelectors.getValueForLoadingKey(store, LoaderKey.global),
      locale: LanguageSelector.getCurrentLocale(store),
      products: ProductSelector.getProducts(store),
      addToBusket: BusketSelector.getAddItemToBusketFunction(store),
      selectProduct: ProductSelector.getSelectProductFunction(store),
      gotoProductPage: RouteSelectors.gotoProductPage(store),
      getProducts: ProductSelector.getProductsForCategory(store),
    );
  }
}
