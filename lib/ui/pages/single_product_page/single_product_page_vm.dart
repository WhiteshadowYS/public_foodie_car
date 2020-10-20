import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class SingleProductPageVM {
  final String logoUrl;
  final void Function() navigateToSettingsPage;
  final void Function(FileModel file) filePreview;
  final ProductModel product;
  final List<FileModel> files;
  final String currentLocale;
  final String Function(String) descriptionText;
  final String Function(String) backButtonText;

  const SingleProductPageVM({
    @required this.logoUrl,
    @required this.navigateToSettingsPage,
    @required this.filePreview,
    @required this.product,
    @required this.files,
    @required this.currentLocale,
    @required this.backButtonText,
    @required this.descriptionText,
  });

  static SingleProductPageVM fromStore(Store<AppState> store) {
    return SingleProductPageVM(
      files: StorageSelector.getInfoFiles(store),
      logoUrl: StorageSelector.getLogoUrl(store),
      product: StorageSelector.getCurrentProductModelFunction(store)(store.state.storageState.openedProductId),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
      filePreview: DialogSelectors.getShowFilePreviewDialogFunction(store),
      currentLocale: StorageSelector.getSelectedLocale(store),
      backButtonText: StorageSelector.getBackButtonText(store),
      descriptionText: StorageSelector.getDescriptionText(store),
    );
  }
}
