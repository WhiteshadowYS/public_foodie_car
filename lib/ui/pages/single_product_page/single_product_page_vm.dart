import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class SingleProductPageVM {
  final String logoUrl;
  final String currentLocale;
  final ProductModel product;
  final List<FileModel> files;

  final void Function() navigateToSettingsPage;
  final void Function(FileModel file) filePreview;
  final void Function(List<String> gallery, int currentIndex) imageView;
  final String Function(String) descriptionText;
  final String Function(String) backButtonText;

  const SingleProductPageVM({
    @required this.files,
    @required this.logoUrl,
    @required this.product,
    @required this.imageView,
    @required this.filePreview,
    @required this.currentLocale,
    @required this.backButtonText,
    @required this.descriptionText,
    @required this.navigateToSettingsPage,
  });

  static SingleProductPageVM fromStore(Store<AppState> store) {
    return SingleProductPageVM(
      /// StorageDataSelector
      files: StorageDataSelector.getInfoFiles(store),
      logoUrl: StorageDataSelector.getLogoUrl(store),

      /// StorageLanguageSelector
      currentLocale: StorageLanguageSelector.getSelectedLocale(store),
      backButtonText: StorageLanguageSelector.getBackButtonText(store),
      descriptionText: StorageLanguageSelector.getDescriptionText(store),

      /// StorageFunctionSelector
      product: StorageFunctionSelector.getCurrentProductModelFunction(store)(store.state.storageState.openedProductId),

      /// Another
      imageView: DialogSelectors.getShowImageViewDialogFunction(store),
      filePreview: DialogSelectors.getShowFilePreviewDialogFunction(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
    );
  }
}
