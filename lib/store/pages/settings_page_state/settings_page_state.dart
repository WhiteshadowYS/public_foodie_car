import 'dart:collection';

import 'package:my_catalog/store/shared/reducer.dart';

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