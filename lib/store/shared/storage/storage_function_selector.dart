import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/check_id_actions/check_id_action.dart';
import 'package:my_catalog/store/shared/storage/actions/get_data_actions/get_data_action.dart';
import 'package:my_catalog/store/shared/storage/actions/remove_opened_storage_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_accepted_terms_actions/update_accepted_terms_id_action.dart';
import 'package:redux/redux.dart';

import '../route_selectors.dart';

abstract class StorageFunctionSelector {


  static void Function() getRemoveOpenedStorageFunction(Store<AppState> store) {
    return () => store.dispatch(RemoveOpenedStorageAction());
  }

  static void Function() getLogOutFunction(Store<AppState> store) {
    return () {
      store.dispatch(RemoveOpenedStorageAction());
      store.dispatch(RouteSelectors.gotoMainPageAction);
    };
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

  static void Function() getAcceptTermsAndNavigateFunction(Store<AppState> store) {
    return () {
      store.dispatch(
        UpdateAcceptedTermsIdAction(
          id: store.state.storageState.openedCatalogId,
          storage: store.state.storageState.storage,
        ),
      );
    };
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
}
