import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_catalog/network/requests/get_check_id_request.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/store/shared/reducer.dart';
import 'package:my_catalog/ui/pages/main_page/main_page.dart';

/// [StorageIdTextFieldState] it is state created for [TextField] in [MainPage].
/// This state need for update only [TextField] data.
/// Params:
///   - [storageId]. ID of storage. Need for next functions: [GetCheckIdRequest], [GetDataRequest]
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
