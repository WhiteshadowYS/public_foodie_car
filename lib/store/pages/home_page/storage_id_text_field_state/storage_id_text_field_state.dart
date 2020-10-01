import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/store/shared/reducer.dart';

class StorageIdTextFieldState {
  final String storageId;

  StorageIdTextFieldState({
    @required this.storageId,
  });
  
  factory StorageIdTextFieldState.initial() {
    return StorageIdTextFieldState(
      storageId: null,
    );
  }

  StorageIdTextFieldState copyWith({
    String storageId,
  }) {
    return StorageIdTextFieldState(
      storageId: storageId ?? this.storageId,
    );
  }

  StorageIdTextFieldState reducer(dynamic action) {
    return Reducer<StorageIdTextFieldState>(
      actions: HashMap.from({}),
    ).updateState(action, this);
  }
}
