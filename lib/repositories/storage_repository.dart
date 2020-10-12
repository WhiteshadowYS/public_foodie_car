import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:my_catalog/adapters/get_check_id_adapter.dart';
import 'package:my_catalog/adapters/get_data_adapter.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/network/requests/get_check_id_request.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';
import 'package:my_catalog/services/local_storage_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';

/// This repository need for get data about storage from server.
/// Methods:
///   - [getStorageData]. This function need for get All data about storage from the server.
///   - [getStorageStatus]. This function need for get last update date of current storage.
class StorageRepository extends Repository {
  Future<BaseHttpResponse<StorageModel>> getStorageData({String storageId}) {
    return repository<BaseHttpResponse<StorageModel>>(
      GetDataAdapter(
        request: GetDataRequest(
          storageId: storageId,
        ),
      ),
    );
  }

  Future<BaseHttpResponse<StorageStatusModel>> getStorageStatus({String storageId}) {
    return repository<BaseHttpResponse<StorageStatusModel>>(
      GetCheckIdAdapter(
        storeId: storageId,
        request: GetCheckIdRequest(
          storageId: storageId,
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

  Future<void> updateStoresHistory({
    @required String id,
    @required String locale,
    @required StorageModel storageModel,
  }) async {
    final SavedStorageModel model = SavedStorageModel(
      id: id,
      locale: locale ?? '',
      storage: storageModel,
    );
    final String json = await LocalStorageService.instance.getValueByKey(StorageKeys.stores);

    if (json == null || json == '') {
      await _overrideStoresHistoryWithModel(model);
      return;
    }

    await _replaceStoreInHistory(model, json);
    return;
  }

  Future<void> updateOpenedStoreId({@required String id}) async {
    final String json = jsonEncode(id);

    await LocalStorageService.instance.saveValueByKey(StorageKeys.openedStoreId, id);
  }

  Future<String> getOpenedStoreId() async {
    return LocalStorageService.instance.getValueByKey(StorageKeys.openedStoreId);
  }

  Future<void> _overrideStoresHistoryWithModel(SavedStorageModel model) async {
    final String json = jsonEncode(<Map>[model.toJson()]);

    await LocalStorageService.instance.saveValueByKey(StorageKeys.stores, json);
  }

  Future<void> _addStoreToHistory(SavedStorageModel model, String json) async {
    final List<SavedStorageModel> history = jsonDecode(json).map<SavedStorageModel>((Map json) {
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
    final List<SavedStorageModel> history = jsonDecode(json).map<SavedStorageModel>((Map json) {
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

    history[index] = model;

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

    if (history[index].update >= statusModel.update) return false;

    return true;
  }
}
