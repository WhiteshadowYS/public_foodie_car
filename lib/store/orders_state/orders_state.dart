import 'dart:collection';

import 'package:foodie_car_template/data/res/const.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:foodie_car_template/store/orders_state/actions/change_order_menu_state_action.dart';
import 'package:foodie_car_template/store/orders_state/actions/close_order_action.dart';
import 'package:foodie_car_template/store/orders_state/actions/start_order_action.dart';
import 'package:foodie_car_template/store/shared/reducer.dart';

enum OrdersMenuState {
  opened,
  inProgress,
  closed,
}

class OrdersState {
  final List<Order> orders;
  final OrdersMenuState menuState;

  OrdersState({
    this.orders,
    this.menuState,
  });

  factory OrdersState.initial() {
    return OrdersState(
      orders: _orders,
      menuState: OrdersMenuState.opened,
    );
  }

  OrdersState copyWith({
    OrdersMenuState menuState,
    List<Order> orders,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
      menuState: menuState ?? this.menuState,
    );
  }

  OrdersState reducer(dynamic action) {
    return Reducer<OrdersState>(
      actions: HashMap.from({
        ChangeOrderMenuStateAction: (action) => _changeMenuState(action as ChangeOrderMenuStateAction),
        StartOrderAction: (action) => _startOrderAction(action as StartOrderAction),
        CloseOrderAction: (action) => _closeOrderAction(action as CloseOrderAction),
      }),
    ).updateState(action, this);
  }

  OrdersState _startOrderAction(StartOrderAction action) {
    return copyWith(
      orders: orders.map<Order>((order) {
        return order.copyWith(
          status: order.id == action.order.id ? ORDER_STATUS_ACTIVE : order.status,
        );
      }).toList(),
    );
  }

  OrdersState _closeOrderAction(CloseOrderAction action) {
    return copyWith(
      orders: orders.map<Order>((order) {
        return order.copyWith(
          status: order.id == action.order.id ? ORDER_STATUS_CLOSED : order.status,
        );
      }).toList(),
    );
  }

  OrdersState _changeMenuState(ChangeOrderMenuStateAction action) {
    return copyWith(
      menuState: action.menuState,
    );
  }
}

const List<Order> _orders = [
  Order(
    id: 0,
    name: 'Roma Titanik 1',
    startTime: '10:00',
    endTime: '16:00',
    startAddress: 'Odessa, Privoz',
    endAddress: 'Одесса, ЖД',
    startPhone: '+380981717888',
    endPhone: '380981717111',
    imageUrl: 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg',
    coast: '200 грн',
    status: 'opened',
  ),
  Order(
    id: 1,
    name: 'Tanya 1',
    startTime: '12:00',
    endTime: '14:00',
    startAddress: 'Odessa, Privoz',
    endAddress: 'Одесса, ЖД',
    startPhone: '+380981717888',
    endPhone: '380981717111',
    imageUrl: 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg',
    coast: '400 грн',
    status: 'active',
  ),
  Order(
    id: 2,
    name: 'Roma Titanik 2',
    startTime: '12:00',
    endTime: '14:00',
    startAddress: 'Odessa, Privoz',
    endAddress: 'Одесса, ЖД',
    startPhone: '+380981717888',
    endPhone: '380981717111',
    imageUrl: 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg',
    coast: '400 грн',
    status: 'active',
  ),
  Order(
    id: 3,
    name: 'Tanya 2',
    startTime: '12:00',
    endTime: '14:00',
    startAddress: 'Odessa, Privoz',
    endAddress: 'Одесса, ЖД',
    startPhone: '+380981717888',
    endPhone: '380981717111',
    imageUrl: 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg',
    coast: '400 грн',
    status: 'closed',
  ),
  Order(
    id: 4,
    name: 'Roma Titanik 3',
    startTime: '12:00',
    endTime: '14:00',
    startAddress: 'Odessa, Privoz',
    endAddress: 'Одесса, ЖД',
    startPhone: '+380981717888',
    endPhone: '380981717111',
    imageUrl: 'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ikRHGbiXJL8o/v0/1000x-1.jpg',
    coast: '400 грн',
    status: 'closed',
  ),
];
