import 'dart:collection';

import 'package:pictures_view/store/application/reducer.dart';

class SettingsPageState {
  SettingsPageState();

  factory SettingsPageState.initial() {
    return SettingsPageState();
  }

  SettingsPageState copyWith() {
    return SettingsPageState();
  }

  SettingsPageState reducer(dynamic action) {
    return Reducer<SettingsPageState>(
      actions: HashMap.fromIterable({}),
    ).updateState(action, this);
  }
}