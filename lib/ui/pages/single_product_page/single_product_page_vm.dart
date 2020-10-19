import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_product_model.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SingleProductPageVM {
  final void Function() navigateToSettingsPage;
  final void Function(FileModel file) filePreview;
  final ProductModel product;
  final List<FileModel> files;
  final String currentLocale;

  const SingleProductPageVM({
    @required this.navigateToSettingsPage,
    @required this.filePreview,
    @required this.product,
    @required this.files,
    @required this.currentLocale,
  });

  static SingleProductPageVM fromStore(Store<AppState> store) {
    return SingleProductPageVM(
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
      filePreview: DialogSelectors.getShowFilePreviewDialogFunction(store),
      product: StorageSelector.getCurrentProductModelFunction(store)(store.state.storageState.openedProductId),
      currentLocale: StorageSelector.getSelectedLocale(store),
      files: StorageSelector.getInfoFiles(store),
    );
  }
}
