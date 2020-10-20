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
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/local_storage_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';

// TODO(Yuri): Update this class!!!!.
/// This repository need for get data about storage from server.
/// Methods:
///   - [getStorageData]. This function need for get All data about storage from the server.
///   - [getStorageStatus]. This function need for get last update date of current storage.
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

  Future<void> updateStoresHistory({
    @required int update,
    @required int id,
    @required String locale,
    @required StorageModel storageModel,
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

    await LocalStorageService.instance.saveValueByKey(StorageKeys.openedStoreId, json);
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

    logger.d('History list: ${history.map((e) => 'id: ${e.id}, update: ${e.update}').toList()}, \nStatus model: ${history[index].update}, \nHistory Model: ${statusModel.update}');

    if (history[index].update == null) return false;

    if (history[index].update > statusModel.update) return false;

    return true;
  }
}
