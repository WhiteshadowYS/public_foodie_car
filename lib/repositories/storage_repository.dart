import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_catalog/adapters/get_check_id_adapter.dart';
import 'package:my_catalog/adapters/get_data_adapter.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/network/requests/get_check_id_request.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';
import 'file:///F:/src/projects/MyCatalog%20projects/MyCatalog/lib/services/local_storage_service.dart';
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

    return decodedData.map((item) => SavedStorageModel.fromJson(item)).toList();
  }

  Future<String> getOpenedStoreId() async {
    return LocalStorageService.instance.getValueByKey(StorageKeys.openedStoreId);
  }
}
