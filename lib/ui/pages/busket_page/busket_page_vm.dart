import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/basket_state/busket_selector.dart';
import 'package:redux/redux.dart';

class BusketPageVM {
  final List<Product> products;
  final void Function(Product) removeFromBusket;

  const BusketPageVM({
    this.removeFromBusket,
    this.products,
  });

  static BusketPageVM init(Store<AppState> store) {
    return BusketPageVM(
      removeFromBusket: BusketSelector.getRemoveItemFromBusketFunction(store),
      products: BusketSelector.getProductsList(store),
    );
  }
}
