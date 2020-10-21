import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/store/global/storage/actions/open_storage_action.dart';
import 'package:my_catalog/store/global/storage/actions/open_terms_action.dart';
import 'package:my_catalog/store/global/storage/actions/set_opened_id_actions.dart';
import 'package:my_catalog/store/global/storage/actions/set_stores_history_action.dart';
import 'package:my_catalog/store/global/storage/actions/update_is_first_open_action.dart';
import 'package:my_catalog/store/global/storage/actions/update_language_action.dart';
import 'package:my_catalog/store/shared/reducer.dart';

// TODO(Yuri): Update comment for this class.
/// [StorageState] it is state of last loaded storage.
/// This state need for save all data need it in the app.
/// Params:
///   - [storage] it is model of storage  what we load from server in [GetDataRequest] class.
class StorageState {
  final int openedStoreId;
  final StorageModel storage;
  final List<SavedStorageModel> storesHistory;

  final int openedCatalogId;
  final int openedCategoryId;
  final int openedSubCategoryId;
  final int openedProductId;

  final bool isFirstOpen;

  StorageState({
    @required this.storesHistory,
    @required this.openedStoreId,
    @required this.storage,

    this.openedCatalogId,
    this.openedCategoryId,
    this.openedSubCategoryId,
    this.openedProductId,
    this.isFirstOpen,
  });

  factory StorageState.initial() {
    return StorageState(
      storage: null,
      openedStoreId: null,
      storesHistory: [],
      isFirstOpen: true,
    );
  }

  StorageState copyWith({
    StorageModel storage,
    int openedStoreId,
    List<SavedStorageModel> storesHistory,
    int openedCatalogId,
    int openedCategoryId,
    int openedSubCategoryId,
    int openedProductId,
    bool isFirstOpen,
  }) {
    return StorageState(
      storage: storage ?? this.storage,
      storesHistory: storesHistory ?? this.storesHistory,
      openedStoreId: openedStoreId ?? this.openedStoreId,
      openedCatalogId: openedCatalogId ?? this.openedCatalogId,
      openedCategoryId: openedCategoryId ?? this.openedCategoryId,
      openedSubCategoryId: openedSubCategoryId ?? this.openedSubCategoryId,
      openedProductId: openedProductId ?? this.openedProductId,
      isFirstOpen: isFirstOpen ?? this.isFirstOpen,
    );
  }

  StorageState reducer(dynamic action) {
    return Reducer<StorageState>(
      actions: HashMap.from({
        OpenStorageAction: (dynamic action) => _openStorage(action as OpenStorageAction),
        OpenTermsAction: (dynamic action) => _openTerms(action as OpenTermsAction),
        SetOpenedStoreIdAction: (dynamic action) => _setOpenedStoreId(action as SetOpenedStoreIdAction),
        SetStoresHistoryAction: (dynamic action) => _setStoresHistory(action as SetStoresHistoryAction),
        UpdateLanguageAction: (dynamic action) => _updateStoreLanguage(action as UpdateLanguageAction),
        SetOpenedCatalogIdAction: (dynamic action) => _setOpenedCatalogId(action as SetOpenedCatalogIdAction),
        SetOpenedCategoryIdAction: (dynamic action) => _setOpenedCategoryId(action as SetOpenedCategoryIdAction),
        SetOpenedSubCategoryIdAction: (dynamic action) => _setOpenedSubCategoryId(action as SetOpenedSubCategoryIdAction),
        SetOpenedProductIdAction: (dynamic action) => _setOpenedProductId(action as SetOpenedProductIdAction),
        UpdateIsFirstOpenAction: (dynamic action) => _updateIsFirstOpen(action as UpdateIsFirstOpenAction),
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

  StorageState _openTerms(OpenTermsAction action) {
    if (action.storage == null) return this;

    return copyWith(
      storage: action.storage,
    );
  }

  StorageState _updateIsFirstOpen(UpdateIsFirstOpenAction action) {
    if (action.isFirstOpen == null) return this;

    return copyWith(
      isFirstOpen: action.isFirstOpen,
    );
  }

  StorageState _setOpenedStoreId(SetOpenedStoreIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedStoreId: action.id,
    );
  }

  StorageState _setOpenedCatalogId(SetOpenedCatalogIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedCatalogId: action.id,
    );
  }

  StorageState _setOpenedCategoryId(SetOpenedCategoryIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedCategoryId: action.id,
    );
  }

  StorageState _setOpenedSubCategoryId(SetOpenedSubCategoryIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedSubCategoryId: action.id,
    );
  }

  StorageState _setOpenedProductId(SetOpenedProductIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedProductId: action.id,
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
