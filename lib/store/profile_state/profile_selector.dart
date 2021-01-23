import 'package:foodie_client_template/domain/entity/order/order.dart';
import 'package:foodie_client_template/domain/entity/user/user.dart';
import 'package:foodie_client_template/store/profile_state/actions/get_order_history.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/store/application/app_state.dart';

abstract class ProfileSelector {
  static List<Order> getOrders(Store<AppState> store) {
    return store.state.profileState?.orders ?? [];
  }

  static User getUser(Store<AppState> store) {
    return store.state.profileState.user;
  }

  static void Function() getLoadOrdersFunction(Store<AppState> store) {
    return () {
      store.dispatch(GetOrderHistory());
    };
  }
}
