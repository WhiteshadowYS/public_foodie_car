import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/order/order.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/domain/entity/user/user.dart';
import 'package:foodie_client_template/store/profile_state/actions/save_order_history.dart';
import 'package:foodie_client_template/store/profile_state/actions/save_user_action.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';

class ProfileState {
  final User user;
  final List<Order> orders;

  ProfileState({
    @required this.user,
    @required this.orders,
  });

  factory ProfileState.initial() {
    return ProfileState(
      user: null,
      orders: [],
    );
  }

  ProfileState copyWith({User user, List<Order> orders}) {
    return ProfileState(
      user: user ?? this.user,
      orders: orders ?? this.orders,
    );
  }

  ProfileState reducer(dynamic action) {
    return Reducer<ProfileState>(
      actions: HashMap.from({
        SaveOrderHistory: (action) => _saveOrders(action as SaveOrderHistory),
        SaveUserAction: (action) => _saveUser(action as SaveUserAction),
      }),
    ).updateState(action, this);
  }

  ProfileState _saveOrders(SaveOrderHistory action) {
    return copyWith(
      orders: action.orders,
    );
  }

  ProfileState _saveUser(SaveUserAction action) {
    return copyWith(
      user: action.user,
    );
  }
}
