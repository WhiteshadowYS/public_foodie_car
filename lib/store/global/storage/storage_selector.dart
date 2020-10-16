import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/check_id_action.dart';
import 'package:my_catalog/store/global/storage/actions/get_data_action.dart';
import 'package:my_catalog/store/global/storage/actions/remove_opened_storage_action.dart';
import 'package:my_catalog/store/global/storage/actions/update_language_action.dart';
import 'package:my_catalog/store/global/storage/storage_state.dart';
import 'package:redux/redux.dart';

/// [StorageSelector] - selector for all data what we save in [StorageState].
/// Methods:
///   - [getDataFunction]. It is function fot get all storage data from the server.
class StorageSelector {
  static void Function() getRemoveOpenedStorageAction(Store<AppState> store) {
    return () => store.dispatch(RemoveOpenedStorageAction());
  }

  static void Function(int, int) getDataFunction(Store<AppState> store) {
    return (int id, int update) {
      store.dispatch(
        GetDataAction(
          id: id,
          update: update,
        ),
      );
    };
  }

  static void Function(int) getCheckIdFunction(Store<AppState> store) {
    return (int id) {
      store.dispatch(
        CheckIdAction(
          id: id,
          getData: getDataFunction(store),
        ),
      );
    };
  }

  static void Function(String) getUpdateLanguageFunction(Store<AppState> store) {
    return (String locale) {
      store.dispatch(
        UpdateLanguageAction(
          newModel: store.state.storageState.storesHistory.last.copyWith(locale: locale),
        ),
      );
    };
  }

  static List<InfoCatalogModel> getInfoCatalogs(Store<AppState> store) {
    final List<InfoCatalogModel> catalogs = store.state.storageState?.storage?.data?.hierarchy ?? [];
    List<InfoCatalogModel> catalogsInSelectedLanguage = [];

    for (InfoCatalogModel catalog in catalogs) {
      if (catalog.displayedIn.contains(store.state.storageState.storesHistory.last.locale)) catalogsInSelectedLanguage.add(catalog);
    }

    return catalogsInSelectedLanguage;
  }

  static List<InfoCategoryModel> getInfoCategories(Store<AppState> store) {
    try {
      final int index = store.state.storageState.storage.data.hierarchy.indexWhere((item) => item.id == store.state.storageState.openedCatalogId);
      final List<InfoCategoryModel> categories = store.state.storageState?.storage?.data?.hierarchy[index].categories ?? [];
      List<InfoCategoryModel> categoriesInSelectedLanguage = [];

      for (InfoCategoryModel category in categories) {
        if (category.displayedIn.contains(store.state.storageState.storesHistory.last.locale)) categoriesInSelectedLanguage.add(category);
      }

      return categoriesInSelectedLanguage;
    } catch (e) {
      return [];
    }
  }

  static List<InfoSubcategoryModel> getInfoSubCategories(Store<AppState> store) {
    try {
      final int catalogIndex = store.state.storageState.storage.data.hierarchy.indexWhere((item) => item.id == store.state.storageState.openedCatalogId);
      final int categoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories.indexWhere((item) => item.id == store.state.storageState.openedCategoryId);
      final List<InfoSubcategoryModel> subcategories = store.state.storageState?.storage?.data?.hierarchy[catalogIndex].categories[categoryIndex].subcategories ?? [];
      List<InfoSubcategoryModel> subcategoriesInSelectedLanguage = [];

      for (InfoSubcategoryModel subcategory in subcategories) {
        if (subcategory.displayedIn.contains(store.state.storageState.storesHistory.last.locale)) subcategoriesInSelectedLanguage.add(subcategory);
      }

      return subcategoriesInSelectedLanguage;
    } catch (e) {
      return [];
    }
  }

  static List<InfoProductModel> getInfoProducts(Store<AppState> store) {
    try {
      final int catalogIndex = store.state.storageState.storage.data.hierarchy.indexWhere((item) => item.id == store.state.storageState.openedCatalogId);
      final int categoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories.indexWhere((item) => item.id == store.state.storageState.openedCategoryId);
      final int subCategoryIndex = store.state.storageState.storage.data.hierarchy[catalogIndex].categories[categoryIndex].subcategories.indexWhere((item) => item.id == store.state.storageState.openedSubCategoryId);
      final List<InfoProductModel> products = store.state.storageState?.storage?.data?.hierarchy[catalogIndex].categories[categoryIndex].subcategories[subCategoryIndex].products ?? [];
      List<InfoProductModel> productsInSelectedLanguage = [];

      for (InfoProductModel product in products) {
        if (product.displayedIn.contains(store.state.storageState.storesHistory.last.locale)) productsInSelectedLanguage.add(product);
      }

      return productsInSelectedLanguage;
    } catch (e) {
      return [];
    }
  }

  static CatalogModel Function(int) getCurrentCatalogModelFunction(Store<AppState> store) {
    return (int id) {
      try {
        final int index = store.state.storageState.storage.data.data.catalogs.indexWhere((item) => item.id == id);

        return store.state.storageState.storage.data.data.catalogs[index];
      } catch (e) {

        return null;
      }
    };
  }

  static CategoryModel Function(int) getCurrentCategoryModelFunction(Store<AppState> store) {
    return (int id) {
      try {
        final int index = store.state.storageState.storage.data.data.categories.indexWhere((item) => item.id == id);

        return store.state.storageState.storage.data.data.categories[index];
      } catch (e) {

        return null;
      }
    };
  }

  static SubcategoryModel Function(int) getCurrentSubCategoryModelFunction(Store<AppState> store) {
    return (int id) {
      try {
        final int index = store.state.storageState.storage.data.data.subcategories.indexWhere((item) => item.id == id);

        return store.state.storageState.storage.data.data.subcategories[index];
      } catch (e) {

        return null;
      }
    };
  }

  static ProductModel Function(int) getCurrentProductModelFunction(Store<AppState> store) {
    return (int id) {
      try {
        final int index = store.state.storageState.storage.data.data.products.indexWhere((item) => item.id == id);

        return store.state.storageState.storage.data.data.products[index];
      } catch (e) {

        return null;
      }
    };
  }

  static List<SavedStorageModel> getHistory(Store<AppState> store) {
    return store.state.storageState.storesHistory;
  }

  static String getSelectedLocale(Store<AppState> store) {
    final SavedStorageModel lastModel = store.state.storageState?.storesHistory?.last;
    int _tmpIndex;

    if (lastModel != null) {
      _tmpIndex = lastModel.storage.settings.languages.indexWhere((lang) => lang.code == lastModel.locale);

      if (_tmpIndex != -1) {
        return lastModel.storage.settings.languages[_tmpIndex].code;
      }
    }

    _tmpIndex = store.state.storageState.storage.settings.languages.indexWhere((lang) => lang.isDefault == true);

    if (_tmpIndex != -1) {
      return store.state.storageState.storage.settings.languages[_tmpIndex].code;
    }

    return store.state.storageState.storage.settings.languages.first.code;
  }

  static String getSelectedLanguage(Store<AppState> store) {
    final SavedStorageModel lastModel = store.state.storageState?.storesHistory?.last;
    int _tmpIndex;

    if (lastModel != null) {
      _tmpIndex = lastModel.storage.settings.languages.indexWhere((lang) => lang.code == lastModel.locale);

      if (_tmpIndex != -1) {
        return lastModel.storage.settings.languages[_tmpIndex].name;
      }
    }

    _tmpIndex = store.state.storageState.storage.settings.languages.indexWhere((lang) => lang.isDefault == true);

    if (_tmpIndex != -1) {
      return store.state.storageState.storage.settings.languages[_tmpIndex].name;
    }

    return store.state.storageState.storage.settings.languages.first.name;
  }

  static List<LanguageModel> getLanguages(Store<AppState> store) {
    return store.state.storageState.storage.settings.languages;
  }

  static bool isNeedShowLanguagesPopup(Store<AppState> store) {
    return store.state.storageState.storage.settings.languages.length > 1;
  }

  static InfoModel getInfoModel(Store<AppState> store) {
    return store.state.storageState.storage.settings.info;
  }
}
