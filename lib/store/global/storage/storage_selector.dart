import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
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
          locale: locale,
        ),
      );
    };
  }

  static List<SavedStorageModel> getHistory(Store<AppState> store) {
    return store.state.storageState.storesHistory;
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
