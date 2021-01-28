import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/orders_state/actions/close_order_action.dart';
import 'package:foodie_car_template/store/orders_state/actions/start_order_action.dart';
import 'package:redux/redux.dart';

abstract class OrdersSelector {
  static List<Order> getOrders(Store<AppState> store) {
    return store.state.ordersState.orders;
  }

  static void Function(Order) getStartOrderFunction(Store<AppState> store) {
    return (Order order) {
      store.dispatch(
        StartOrderAction(order: order),
      );
    };
  }

  static void Function(Order) getCloseOrderFunction(Store<AppState> store) {
    return (Order order) {
      store.dispatch(
        CloseOrderAction(order: order),
      );
    };
  }
}
