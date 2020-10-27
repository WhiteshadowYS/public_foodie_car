import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_catalog/adapters/get_check_id_adapter.dart';
import 'package:my_catalog/adapters/get_data_adapter.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/network/requests/get_check_id_request.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';
import 'package:my_catalog/res/api.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/local_storage_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';

/// This repository need for get data about storage from server.
/// Methods:
///   - [getStorageData]. This function need for get All data about storage from the server.
///   - [getStorageStatus]. This function need for get last update date of current storage.
///   - [getStoresHistory]. This function need for get history from storage.
///   - [getIsTermsAccepted]. This function need for get info about is terms accepted from storage.
///   - [saveIsTermsAccepted]. This function need to save store id with accepted terms to storage.
///   - [saveIsFirstOpen]. This function need to save if store first time opened to storage.
///   - [getIsFirstOpen]. This function need for get info if store is first time opened from storage.
///   - [updateStoresHistory]. This function need for updating store info in storage.
///   - [updateOpenedStoreId]. This function need for updating opened store id in storage.
///   - [removeOpenedStoreId]. This function need for removing opened store id from storage.
///   - [getOpenedStoreId]. This function need for getting opened store id from storage
///   - [_overrideStoresHistoryWithModel]. This function need for overriding stores history in storage.
///   - [_addStoreToHistory]. This function need for add new store to history in storage.
///   - [_replaceStoreInHistory]. This function need for replacing store in storage.
///   - [isLastUpdate]. This function need to check if storage contains last version of stores.

class StorageRepository extends Repository {
  Future<BaseHttpResponse<StorageModel>> getStorageData({int id}) {
    return repository<BaseHttpResponse<StorageModel>>(
      GetDataAdapter(
        request: GetDataRequest(
          id: id,
        ),
      ),
    );
  }

  Future<BaseHttpResponse<StorageStatusModel>> getStorageStatus({int id}) {
    return repository<BaseHttpResponse<StorageStatusModel>>(
      GetCheckIdAdapter(
        storeId: id,
        request: GetCheckIdRequest(
          id: id,
        ),
      ),
    );
  }

  Future<List<SavedStorageModel>> getStoresHistory() async {
    final String storesJson = await LocalStorageService.instance.getValueByKey(StorageKeys.stores);

    if (storesJson == null || storesJson == '') {
      return null;
    }

    final List decodedData = jsonDecode(storesJson);

    return decodedData.map<SavedStorageModel>((item) => SavedStorageModel.fromJson(item)).toList();
  }

  Future<bool> getIsTermsAccepted(String id) async {
    final String acceptedIdList = await LocalStorageService.instance.getValueByKey(StorageKeys.acceptedStoreId);

    if (acceptedIdList == null || acceptedIdList == '') {
      return false;
    }

    final List<String> _idList = acceptedIdList.split('|');

    for (String _id in _idList) {
      if (_id == id) return true;
    }

    return false;
  }

  Future<void> saveIsTermsAccepted(String acceptedId) async {
    final String acceptedIdList = await LocalStorageService.instance.getValueByKey(StorageKeys.acceptedStoreId);

    if (acceptedIdList == null || acceptedIdList == '') {
      await LocalStorageService.instance.saveValueByKey(StorageKeys.acceptedStoreId, '$acceptedId|');
      return;
    }

    await LocalStorageService.instance.saveValueByKey(StorageKeys.acceptedStoreId, acceptedIdList + '$acceptedId|');
  }

  Future<void> saveIsFirstOpen({String id, bool isFirstOpen = true}) async {
    final Map<String, dynamic> newValue = {id: isFirstOpen};

    final String json = await LocalStorageService.instance.getValueByKey(StorageKeys.isFirstOpen);

    if (json == null || json == '') {
      await LocalStorageService.instance.saveValueByKey(StorageKeys.isFirstOpen, jsonEncode([newValue]));
      return;
    }

    final List oldValue = jsonDecode(json);

    List<Map<String, dynamic>> newList = [];

    oldValue.forEach((element) {
      newList.add(element as Map<String, dynamic>);
    });

    newList.removeWhere((Map<String, dynamic> element) => element.containsKey(id));

    newList.add(newValue);

    final String newJson = jsonEncode(newList);

    await LocalStorageService.instance.saveValueByKey(StorageKeys.isFirstOpen, newJson);
  }

  Future<bool> getIsFirstOpen(String id) async {
    try {
      final String json = await LocalStorageService.instance.getValueByKey(StorageKeys.isFirstOpen);
      final List value = jsonDecode(json);

      for (Map<String, dynamic> element in value) {
        if (element.containsKey(id)) {
          return element[id];
        }
      }

      return true;
    } catch (e) {
      return true;
    }
  }

  Future<void> updateStoresHistory({
    @required int id,
    @required int update,
    @required StorageModel storageModel,
    String locale,
  }) async {
    final SavedStorageModel model = SavedStorageModel(
      id: id,
      locale: locale ?? '',
      storage: storageModel,
      update: update,
    );
    final String json = await LocalStorageService.instance.getValueByKey(StorageKeys.stores);

    if (json == null || json == '') {
      await _overrideStoresHistoryWithModel(model);
      return;
    }

    await _replaceStoreInHistory(model, json);
    return;
  }

  Future<void> updateOpenedStoreId({@required int id}) async {
    final String json = jsonEncode(id);
    final String jsonStore = await LocalStorageService.instance.getValueByKey(StorageKeys.stores);
    final List<dynamic> stores = (jsonDecode(jsonStore) as List<dynamic>);

    for (var item in stores) {
      if (item[ApiKeys.id] == id) {

        final temp = item;
        stores.remove(item);
        stores.add(temp);
        break;
      }
    }

    await LocalStorageService.instance.saveValueByKey(StorageKeys.openedStoreId, json);
    await LocalStorageService.instance.saveValueByKey(StorageKeys.stores, jsonEncode(stores));
  }

  Future<void> removeOpenedStoreId() async {
    await LocalStorageService.instance.saveValueByKey(StorageKeys.openedStoreId, '');
  }

  Future<int> getOpenedStoreId() async {
    final String id = await LocalStorageService.instance.getValueByKey(StorageKeys.openedStoreId);

    return id != null ? int.tryParse(id) : null;
  }

  Future<void> _overrideStoresHistoryWithModel(SavedStorageModel model) async {
    final String json = jsonEncode(<Map>[model.toJson()]);

    await LocalStorageService.instance.saveValueByKey(StorageKeys.stores, json);
  }

  Future<void> _addStoreToHistory(SavedStorageModel model, String json) async {
    final List<SavedStorageModel> history = jsonDecode(json).map<SavedStorageModel>((json) {
      return SavedStorageModel.fromJson(json);
    }).toList();

    if (history == null) {
      await _overrideStoresHistoryWithModel(model);
      return;
    }

    json = jsonEncode(history..add(model));
    await LocalStorageService.instance.saveValueByKey(StorageKeys.stores, json);
  }

  Future<void> _replaceStoreInHistory(SavedStorageModel model, String json) async {
    final List<SavedStorageModel> history = jsonDecode(json).map<SavedStorageModel>((json) {
      return SavedStorageModel.fromJson(json);
    }).toList();

    if (history == null) {
      await _addStoreToHistory(model, json);
      return;
    }

    final int index = history.indexWhere((_model) {
      return _model.id == model.id;
    });

    if (index == -1) {
      await _addStoreToHistory(model, json);
      return;
    }

    String newLocale = '';
    if (model.locale == '' || model.locale == null) {
      newLocale = history[index]?.locale ?? '';
    } else {
      newLocale = model.locale;
    }

    history[index] = SavedStorageModel(
      id: model.id,
      update: model.update,
      locale: newLocale,
      storage: model.storage,
    );

    json = jsonEncode(history);

    await LocalStorageService.instance.saveValueByKey(StorageKeys.stores, json);
  }

  Future<bool> isLastUpdate(StorageStatusModel statusModel) async {
    final List<SavedStorageModel> history = await getStoresHistory();

    if (history == null) return false;

    final int index = history.indexWhere((model) {
      return model.id == statusModel.id;
    });

    if (index == -1) return false;

    logger.d(
        'History list: ${history.map((e) => 'id: ${e.id}, update: ${e.update}').toList()}, \nStatus model: ${history[index].update}, \nHistory Model: ${statusModel.update}');

    if (history[index].update == null || statusModel.update == null) return false;

    if (history[index].update > statusModel.update) return false;

    return true;
  }
}
