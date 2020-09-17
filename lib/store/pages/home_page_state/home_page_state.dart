import 'dart:collection';

import 'package:pictures_view/store/application/reducer.dart';

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