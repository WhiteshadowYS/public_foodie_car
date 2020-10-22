import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

abstract class StorageDataSelector {
  static String getLogoUrl(Store<AppState> store) {
    return store.state.storageState.storage?.settings?.info?.logoImage;
  }

  static String getTermsText(Store<AppState> store) {
    return store.state?.storageState?.storage?.settings?.tac ?? '';
  }

  static InfoModel getInfoModel(Store<AppState> store) {
    return store.state.storageState.storage.settings.info;
  }

  static List<SavedStorageModel> getHistory(Store<AppState> store) {
    return store.state.storageState.storesHistory;
  }

  static List<InfoCatalogModel> getInfoCatalogs(Store<AppState> store) {
    final List<InfoCatalogModel> catalogs = store.state.storageState?.storage?.data?.hierarchy ?? [];

    return catalogs;
  }

  static List<InfoCategoryModel> getInfoCategories(Store<AppState> store) {
    try {
      final int index = store.state.storageState.storage.data.hierarchy.indexWhere(
        (item) => item.id == store.state.storageState.openedCatalogId,
      );
      final List<InfoCategoryModel> categories = store.state.storageState?.storage?.data?.hierarchy[index].categories ?? [];
      final List<InfoCategoryModel> categoriesInSelectedLanguage = [];

      for (InfoCategoryModel category in categories) {
        final bool displayCheck = category.displayedIn.contains(
          StorageLanguageSelector.getSelectedLocale(store),
        );

        if (displayCheck) categoriesInSelectedLanguage.add(category);
      }

      return categoriesInSelectedLanguage;
    } catch (e) {
      return [];
    }
  }

  static List<InfoSubcategoryModel> getInfoSubCategories(Store<AppState> store) {
    try {
      final int catalogIndex = store.state.storageState.storage.data.hierarchy.indexWhere(
        (item) => item.id == store.state.storageState.openedCatalogId,
      );
      final int categoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories.indexWhere(
        (item) => item.id == store.state.storageState.openedCategoryId,
      );
      final List<InfoSubcategoryModel> subcategories =
          store.state.storageState?.storage?.data?.hierarchy[catalogIndex].categories[categoryIndex].subcategories ?? [];
      final List<InfoSubcategoryModel> subcategoriesInSelectedLanguage = [];

      for (InfoSubcategoryModel subcategory in subcategories) {
        final bool displayCheck = subcategory.displayedIn.contains(StorageLanguageSelector.getSelectedLocale(store));

        if (displayCheck) subcategoriesInSelectedLanguage.add(subcategory);
      }

      return subcategoriesInSelectedLanguage;
    } catch (e) {
      return [];
    }
  }

  static List<InfoProductModel> getInfoProducts(Store<AppState> store) {
    try {
      final int catalogIndex = store.state.storageState.storage.data.hierarchy.indexWhere(
        (item) => item.id == store.state.storageState.openedCatalogId,
      );
      final int categoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories.indexWhere(
        (item) => item.id == store.state.storageState.openedCategoryId,
      );
      final int subCategoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories[categoryIndex].subcategories.indexWhere(
        (item) => item.id == store.state.storageState.openedSubCategoryId,
      );
      final List<InfoProductModel> products =
          store.state.storageState?.storage?.data?.hierarchy[catalogIndex].categories[categoryIndex].subcategories[subCategoryIndex].products ?? [];
      final List<InfoProductModel> productsInSelectedLanguage = [];

      for (InfoProductModel product in products) {
        final bool displayCheck = product.displayedIn.contains(StorageLanguageSelector.getSelectedLocale(store));

        if (displayCheck) productsInSelectedLanguage.add(product);
      }

      return productsInSelectedLanguage;
    } catch (e) {
      return [];
    }
  }

  static List<FileModel> getInfoFiles(Store<AppState> store) {
    try {
      final int catalogIndex = store.state.storageState.storage.data.hierarchy.indexWhere(
        (item) => item.id == store.state.storageState.openedCatalogId,
      );
      final int categoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories.indexWhere(
        (item) => item.id == store.state.storageState.openedCategoryId,
      );
      final int subCategoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories[categoryIndex].subcategories.indexWhere(
        (item) => item.id == store.state.storageState.openedSubCategoryId,
      );
      final int productIndex =
          store.state.storageState.storage.data.hierarchy[catalogIndex].categories[categoryIndex].subcategories[subCategoryIndex].products.indexWhere(
        (item) => item.id == store.state.storageState.openedProductId,
      );
      final List<int> filesIndexes = store.state.storageState?.storage?.data?.hierarchy[catalogIndex].categories[categoryIndex]
              .subcategories[subCategoryIndex].products[productIndex].files ??
          [];
      final List<FileModel> files = [];

      for (FileModel file in store.state.storageState?.storage?.data?.data?.files ?? []) {
        for (int index in filesIndexes) {
          if (file.id == index) files.add(file);
        }
      }

      final List<FileModel> filesInSelectedLanguage = [];

      for (FileModel file in files) {
        final bool displayCheck = file.languages.containsKey(StorageLanguageSelector.getSelectedLocale(store));

        if (displayCheck) filesInSelectedLanguage.add(file);
      }

      return filesInSelectedLanguage;
    } catch (e) {
      return [];
    }
  }

  static List<FooterButtonModel> getFooterButtons(Store<AppState> store) {
    try {
      return store.state.storageState.storage.settings.footerButtons;
    } catch (e) {
      return null;
    }
  }
}
