import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_catalog/network/requests/get_check_id_request.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/store/shared/reducer.dart';
import 'package:my_catalog/ui/pages/main_page/main_page.dart';

import 'storage_id_text_field_actions.dart';

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
      storageId: EMPTY_STING,
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
      actions: HashMap.from({
        SaveIdCatalogAction: (dynamic action) => _saveIdCatalogAction(action as SaveIdCatalogAction),
      }),
    ).updateState(action, this);
  }

  StorageIdTextFieldState _saveIdCatalogAction(SaveIdCatalogAction action) {
    return copyWith(
      storageId: action.id,
    );
  }
}
