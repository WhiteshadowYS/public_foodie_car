import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/store/shared/reducer.dart';

/// [StorageState] it is state of last loaded storage.
/// This state need for save all data need it in the app.
/// Params:
///   - [storage] it is model of storage  what we load from server in [GetDataRequest] class.
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
