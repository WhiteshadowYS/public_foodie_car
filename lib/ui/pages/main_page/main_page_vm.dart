import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class MainPageVM {
  final List<SavedStorageModel> stores;
  final void Function(int) checkId;
  final void Function(String logoUrl) exitDialog;

  MainPageVM({
    @required this.stores,
    @required this.checkId,
    @required this.exitDialog,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      /// StorageDataSelector
      stores: StorageDataSelector.getHistory(store),

      /// StorageFunctionSelector
      checkId: StorageFunctionSelector.getCheckIdFunction(store),

      /// Another
      exitDialog: DialogSelectors.getExitDialogFunction(store),
    );
  }
}
