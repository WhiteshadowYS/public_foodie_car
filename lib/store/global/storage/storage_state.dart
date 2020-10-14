import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/store/global/storage/actions/open_storage_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_opened_store_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_stores_history_action.dart';
import 'package:my_catalog/store/global/storage/actions/update_language_action.dart';
import 'package:my_catalog/store/shared/reducer.dart';

/// [StorageState] it is state of last loaded storage.
/// This state need for save all data need it in the app.
/// Params:
///   - [storage] it is model of storage  what we load from server in [GetDataRequest] class.
class StorageState {
  final int openedStoreId;
  final StorageModel storage;
  final List<SavedStorageModel> storesHistory;

  StorageState({
    @required this.storesHistory,
    @required this.openedStoreId,
    @required this.storage,
  });

  factory StorageState.initial() {
    return StorageState(
      storage: null,
      openedStoreId: null,
      storesHistory: [],
    );
  }

  StorageState copyWith({
    StorageModel storage,
    int openedStoreId,
    List<SavedStorageModel> storesHistory,
  }) {
    return StorageState(
      storage: storage ?? this.storage,
      storesHistory: storesHistory ?? this.storesHistory,
      openedStoreId: openedStoreId ?? this.openedStoreId,
    );
  }

  StorageState reducer(dynamic action) {
    return Reducer<StorageState>(
      actions: HashMap.from({
        OpenStorageAction: (dynamic action) => _openStorage(action as OpenStorageAction),
        SetOpenedStoreIdAction: (dynamic action) => _setOpenedStoreId(action as SetOpenedStoreIdAction),
        SetStoresHistoryAction: (dynamic action) => _setStoresHistory(action as SetStoresHistoryAction),
        UpdateLanguageAction: (dynamic action) => _updateStoreLanguage(action as UpdateLanguageAction),
      }),
    ).updateState(action, this);
  }

  StorageState _openStorage(OpenStorageAction action) {
    if (action.storage == null || action.id == null) return this;

    return copyWith(
      openedStoreId: action.id,
      storage: action.storage,
    );
  }

  StorageState _setOpenedStoreId(SetOpenedStoreIdAction action) {
    if (action.storeId == null) return this;

    return copyWith(
      openedStoreId: action.storeId,
    );
  }

  StorageState _setStoresHistory(SetStoresHistoryAction action) {
    if (action.storesHistory == null || action.storesHistory.isEmpty) return this;

    return copyWith(
      storesHistory: action.storesHistory,
    );
  }

  StorageState _updateStoreLanguage(UpdateLanguageAction action) {
    if (action.newModel == null) return this;

    return copyWith(
      storesHistory: List.from(storesHistory)
        ..removeLast()
        ..add(action.newModel),
    );
  }
}
