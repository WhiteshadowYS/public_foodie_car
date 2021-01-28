import 'package:flutter/material.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/map_dialog.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/phone_dialog.dart';
import 'package:foodie_car_template/store/orders_state/actions/change_order_menu_state_action.dart';
import 'package:foodie_car_template/store/orders_state/orders_selector.dart';
import 'package:foodie_car_template/store/orders_state/orders_state.dart';
import 'package:redux/redux.dart';
import 'package:foodie_car_template/store/application/app_state.dart';

class HomePageVM {
  final List<Order> orders;
  final OrdersMenuState menuState;
  final void Function(OrdersMenuState) changeMenuState;
  final void Function(Order) startOrder;
  final void Function(Order) closeOrder;
  final void Function(String) openPhoneDialog;
  final void Function(String) openMapDialog;

  const HomePageVM({
    @required this.orders,
    @required this.menuState,
    @required this.startOrder,
    @required this.closeOrder,
    @required this.changeMenuState,
    @required this.openPhoneDialog,
    @required this.openMapDialog,
  });

  static HomePageVM init(Store<AppState> store) {
    return HomePageVM(
      orders: OrdersSelector.getOrders(store),
      openMapDialog: (String address) => DialogService.instance.show(
        MapDialog(address: address),
      ),
      openPhoneDialog: (String phone) => DialogService.instance.show(
        PhoneDialog(phone: phone),
      ),
      startOrder: OrdersSelector.getStartOrderFunction(store),
      closeOrder: OrdersSelector.getCloseOrderFunction(store),
      menuState: store.state.ordersState.menuState,
      changeMenuState: (OrdersMenuState menuState) {
        store.dispatch(
          ChangeOrderMenuStateAction(
            menuState: menuState,
          ),
        );
      },
    );
  }
}
