import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function(int) checkId;
  final List<SavedStorageModel> stores;
  final void Function(String logoUrl) exitDialog;

  MainPageVM({
    @required this.stores,
    @required this.checkId,
    @required this.exitDialog,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      stores: StorageSelector.getHistory(store),
      checkId: StorageSelector.getCheckIdFunction(store),
      exitDialog: DialogSelectors.getExitDialogFunction(store),
    );
  }
}
