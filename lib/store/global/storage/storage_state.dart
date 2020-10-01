import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/store/shared/reducer.dart';

class StorageState {
  final StorageModel storage;

  StorageState({
    @required this.storage,
  });

  factory StorageState.initial() {
    return StorageState(
      storage: null,
    );
  }

  StorageState copyWith({
    StorageModel storage,
  }) {
    return StorageState(
      storage: storage ?? this.storage,
    );
  }

  StorageState reducer(dynamic action) {
    return Reducer<StorageState>(
      actions: HashMap.from({}),
    ).updateState(action, this);
  }
}
