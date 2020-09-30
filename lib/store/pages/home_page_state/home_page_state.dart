import 'dart:collection';

import 'package:my_catalog/store/shared/reducer.dart';

class HomePageState {
  HomePageState();

  factory HomePageState.initial() {
    return HomePageState();
  }

  HomePageState copyWith() {
    return HomePageState();
  }

  HomePageState reducer(dynamic action) {
    return Reducer<HomePageState>(
      actions: HashMap.fromIterable({}),
    ).updateState(action, this);
  }
}