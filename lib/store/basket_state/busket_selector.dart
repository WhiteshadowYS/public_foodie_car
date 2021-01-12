import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/basket_state/actions/add_to_busket_action.dart';
import 'package:foodie_client_template/store/basket_state/actions/clear_busket_action.dart';
import 'package:foodie_client_template/store/basket_state/actions/remove_from_busket_action.dart';
import 'package:redux/redux.dart';

abstract class BusketSelector {
  static List<Product> getProductsList(Store<AppState> store) {
    return store.state.busketState.products;
  }

  static void Function(Product) getAddItemToBusketFunction(Store<AppState> store) {
    return (Product product) {
      store.dispatch(AddToBusketAction(
        product: product,
      ));
    };
  }

  static void Function(Product) getRemoveItemFromBusketFunction(Store<AppState> store) {
    return (Product product) {
      store.dispatch(RemoveFromBusketAction(
        product: product,
      ));
    };
  }

  static void Function() getClearBusketFunction(Store<AppState> store) {
    return () => store.dispatch(ClearBusketAction());
  }
}
