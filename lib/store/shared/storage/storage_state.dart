import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/store/shared/reducer.dart';
import 'package:my_catalog/store/shared/storage/actions/open_store_actions/open_store_action.dart';
import 'package:my_catalog/store/shared/storage/actions/open_terms_actions/open_terms_action.dart';
import 'package:my_catalog/store/shared/storage/actions/set_opened_id_actions.dart';
import 'package:my_catalog/store/shared/storage/actions/set_stores_history_actions/set_stores_history_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_is_first_open_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/set_language_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/update_language_action.dart';
import 'package:my_catalog/theme/custom_theme.dart';

/// [StorageState] it is state of last loaded storage.
/// This state need for save all data need it in the app.
/// Params:
///   - [openedStoreId] this variable returns the current store.
///   - [storage] it is model of storage  what we load from server in [GetDataRequest] class.
///   - [storesHistory] this variable stores everything we were in.
///   - [openedCatalogId] this variable returns the current catalog.
///   - [openedCategoryId] this variable returns the current category.
///   - [openedSubCategoryId] this variable returns the current subcategory.
///   - [openedProductId] this variable returns the current product.
///   - [isFirstOpen] this variable fixes whether it is the first input.
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

  /// factory [initial], sets the default value for an instance of the class [StorageState].
  factory StorageState.initial() {
    return StorageState(
      storage: null,
      openedStoreId: null,
      storesHistory: [],
      isFirstOpen: true,
    );
  }

  /// The class [StorageState], overrides the main method [copyWith].
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

  ///The [reducer] function is the main Reducer in which you call Reducer, all other states.
  StorageState reducer(dynamic action) {
    return Reducer<StorageState>(
      actions: HashMap.from({
        OpenStoreAction: (dynamic action) => _openStore(action as OpenStoreAction),
        OpenTermsAction: (dynamic action) => _openTerms(action as OpenTermsAction),
        SetOpenedStoreIdAction: (dynamic action) => _setOpenedStoreId(action as SetOpenedStoreIdAction),
        SetStoresHistoryAction: (dynamic action) => _setStoresHistory(action as SetStoresHistoryAction),
        UpdateLanguageAction: (dynamic action) => _updateStoreLanguage(action as UpdateLanguageAction),
        SetLanguageAction: (dynamic action) => _setStoreLanguage(action as SetLanguageAction),
        SetOpenedCatalogIdAction: (dynamic action) => _setOpenedCatalogId(action as SetOpenedCatalogIdAction),
        SetOpenedCategoryIdAction: (dynamic action) => _setOpenedCategoryId(action as SetOpenedCategoryIdAction),
        SetOpenedSubCategoryIdAction: (dynamic action) =>
            _setOpenedSubCategoryId(action as SetOpenedSubCategoryIdAction),
        SetOpenedProductIdAction: (dynamic action) => _setOpenedProductId(action as SetOpenedProductIdAction),
        UpdateIsFirstOpenAction: (dynamic action) => _updateIsFirstOpen(action as UpdateIsFirstOpenAction),
      }),
    ).updateState(action, this);
  }

  /// The [_openStore] function accepts the [action] parameter, which has the [OpenStoreAction] type.
  /// The [action] parameter has 2 parameters [id], [storage].
  /// If successful, it writes a new value to the state, to [openStoreId] and [storage] parameters.
  StorageState _openStore(OpenStoreAction action) {
    if (action.storage == null || action.id == null) return this;

    if (action.storage?.settings?.colors != null) {
      CustomTheme.instance.setColorsFromJson(action.storage?.settings?.colors?.toJson());
    }

    return copyWith(
      openedStoreId: action.id,
      storage: action.storage,
    );
  }

  /// The [_openTerms] function accepts the [action] parameter, which has the [OpenTermsAction] type.
  /// The [action] parameter has parameter [storage].
  /// If successful, it writes a new value to the state, to [storage] parameters.
  StorageState _openTerms(OpenTermsAction action) {
    if (action.storage == null) return this;

    if (action.storage?.settings?.colors != null) {
      CustomTheme.instance.setColorsFromJson(action.storage?.settings?.colors?.toJson());
    }

    return copyWith(
      storage: action.storage,
    );
  }

  /// The [_updateIsFirstOpen] function accepts the [action] parameter, which has the [UpdateIsFirstOpenAction] type.
  /// The [action] parameter has parameter [isFirstOpen].
  /// If successful, it writes a new value to the state, to [isFirstOpen] parameters.
  StorageState _updateIsFirstOpen(UpdateIsFirstOpenAction action) {
    if (action.isFirstOpen == null) return this;
    return copyWith(
      isFirstOpen: action.isFirstOpen,
    );
  }

  /// The [_setOpenedStoreId] function accepts the [action] parameter, which has the [SetOpenedStoreIdAction] type.
  /// The [action] parameter has parameter [id].
  /// If successful, it writes a new value to the state, to [openedStoreId] parameters.
  StorageState _setOpenedStoreId(SetOpenedStoreIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedStoreId: action.id,
    );
  }

  /// The [_setOpenedCatalogId] function accepts the [action] parameter, which has the [SetOpenedCatalogIdAction] type.
  /// The [action] parameter has parameter [id].
  /// If successful, it writes a new value to the state, to [openedCatalogId] parameters.
  StorageState _setOpenedCatalogId(SetOpenedCatalogIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedCatalogId: action.id,
    );
  }

  /// The [_setOpenedCategoryId] function accepts the [action] parameter, which has the [SetOpenedCategoryIdAction] type.
  /// The [action] parameter has parameter [id].
  /// If successful, it writes a new value to the state, to [openedCategoryId] parameters.
  StorageState _setOpenedCategoryId(SetOpenedCategoryIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedCategoryId: action.id,
    );
  }

  /// The [_setOpenedSubCategoryId] function accepts the [action] parameter, which has the [SetOpenedSubCategoryIdAction] type.
  /// The [action] parameter has parameter [id].
  /// If successful, it writes a new value to the state, to [openedSubCategoryId] parameters.
  StorageState _setOpenedSubCategoryId(SetOpenedSubCategoryIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedSubCategoryId: action.id,
    );
  }

  /// The [_setOpenedProductId] function accepts the [action] parameter, which has the [SetOpenedProductIdAction] type.
  /// The [action] parameter has parameter [id].
  /// If successful, it writes a new value to the state, to [openedProductId] parameters.
  StorageState _setOpenedProductId(SetOpenedProductIdAction action) {
    if (action.id == null) return this;

    return copyWith(
      openedProductId: action.id,
    );
  }

  /// The [_setStoresHistory] function accepts the [action] parameter, which has the [SetStoresHistoryAction] type.
  /// The [action] parameter has parameter [storesHistory].
  /// If successful, it writes a new value to the state, to [storesHistory] parameters.
  StorageState _setStoresHistory(SetStoresHistoryAction action) {
    if (action.storesHistory == null || action.storesHistory.isEmpty) return this;

    final List<SavedStorageModel> history = action.storesHistory;
    final temp = action.storesHistory.firstWhere(
      (element) => element.id == action.idSelect ?? openedStoreId,
      orElse: () {
        return null;
      },
    );

    if (temp != null) {
      history.remove(temp);
      history.add(temp);
    }

    return copyWith(
      storesHistory: history,
    );
  }

  /// The [_updateStoreLanguage] function accepts the [action] parameter, which has the [UpdateLanguageAction] type.
  /// The [action] parameter has parameter [newModel].
  /// If successful, it writes a new value to the state, to [storesHistory] parameters.
  StorageState _updateStoreLanguage(UpdateLanguageAction action) {
    if (action.newModel == null) return this;

    if (storesHistory == null || storesHistory.isEmpty) {
      logger.w('List of stores was empty: <SetLanguageAction>');
      return this;
    }

    final int index = storesHistory.indexWhere((element) {
      return element.id == action.newModel.id;
    });

    if (index == null || index == -1) {
      logger.w('Storage not found, action: <SetLanguageAction>');
      return this;
    }

    storesHistory.removeAt(index);
    storesHistory.insert(
      index,
      action.newModel,
    );

    return copyWith(
      storesHistory: storesHistory,
    );
  }

  /// The [_updateStoreLanguage] function accepts the [action] parameter, which has the [UpdateLanguageAction] type.
  /// The [action] parameter has parameter [newModel].
  /// If successful, it writes a new value to the state, to [storesHistory] parameters.
  StorageState _setStoreLanguage(SetLanguageAction action) {
    if (action.model == null) return this;

    if (storesHistory == null || storesHistory.isEmpty) {
      logger.w('List of stores was empty: <SetLanguageAction>');
      return this;
    }

    final int index = storesHistory.indexWhere((element) {
      return element.id == action.id;
    });

    if (index == null || index == -1) {
      logger.w('Storage not found, action: <SetLanguageAction>');
      return this;
    }

    final SavedStorageModel model = storesHistory[index];

    storesHistory.removeAt(index);
    storesHistory.insert(
        index,
        model.copyWith(
          storage: action.model,
        ));

    return copyWith(
      storesHistory: storesHistory,
    );
  }
}
