import 'package:foodie_client_template/store/product_state/product_selector.dart';
import 'package:foodie_client_template/store/shared/loader/loader_selectors.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:foodie_client_template/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/basket_state/busket_selector.dart';
import 'package:foodie_client_template/store/shared/language_state/language_selector.dart';

class ProductPageVM {
  final bool isLoading;
  final String locale;

  final void Function(Product) addToBusket;
  final void Function() pop;
  final Product product;

  const ProductPageVM({
    this.isLoading,
    this.locale,
    this.product,
    this.addToBusket,
    this.pop,
  });

  static ProductPageVM init(Store<AppState> store) {
    return ProductPageVM(
      isLoading: LoaderSelectors.getValueForLoadingKey(store, LoaderKey.global),
      locale: LanguageSelector.getCurrentLocale(store),
      product: ProductSelector.getSelectedProduct(store),
      addToBusket: BusketSelector.getAddItemToBusketFunction(store),
      pop: RouteSelectors.doPop(store),
    );
  }
}
