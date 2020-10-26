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

///[SingleProductPageVM] view model for SingleProductPage
///[logoUrl] - string with logo url which is taken from [StorageDataSelector.getLogoUrl].
///[currentLocale] - string with current locale which is taken from [StorageLanguageSelector.getSelectedLocale].
///[product] - [ProductModel] which is taken from  [StorageFunctionSelector.getCurrentProductModelFunction].
///[files] - list with [FileModel] which is taken from [StorageDataSelector.getInfoFiles].
///[navigateToSettingsPage] - void function with int param for navigation to settings page which is taken from [RouteSelectors.gotoSettingsPage].
///[showImage] - void function with 2 params: List<String> gallery and int currentIndex for showing image which is taken from [DialogSelectors.getShowImageViewDialogFunction].
///[filePreview] - void function with [FileModel] param for showing file preview which is taken from [DialogSelectors.getShowFilePreviewDialogFunction].
///[descriptionText] - void function with string param for getting description text from [StorageLanguageSelector.getDescriptionText].
///[backButtonText] - void function with string param for getting text for back button from [StorageLanguageSelector.getBackButtonText].

class SingleProductPageVM {
  final String logoUrl;
  final String currentLocale;
  final ProductModel product;
  final List<FileModel> files;

  final void Function() navigateToSettingsPage;
  final void Function(FileModel file) filePreview;
  final void Function(List<String> gallery, int currentIndex) showImage;
  final String Function(String) descriptionText;
  final String Function(String) backButtonText;

  const SingleProductPageVM({
    @required this.files,
    @required this.logoUrl,
    @required this.product,
    @required this.showImage,
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
      showImage: DialogSelectors.getShowImageViewDialogFunction(store),
      filePreview: DialogSelectors.getShowFilePreviewDialogFunction(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
    );
  }
}
