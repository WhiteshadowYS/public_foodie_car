import 'package:my_catalog/adapters/get_check_id_adapter.dart';
import 'package:my_catalog/adapters/get_data_adapter.dart';
import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/network/requests/get_check_id_request.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';

/// This repository need for get data about storage from server.
/// Methods:
///   - [getStorageData]. This function need for get All data about storage from the server.
///   - [getStorageStatus]. This function need for get last update date of current storage.
class StorageRepository extends Repository {
  Future<StorageModel> getStorageData({String storageId}) {
    return repository<StorageModel>(
      GetDataAdapter(
        request: GetDataRequest(
          storageId: storageId,
        ),
      ),
    );
  }

  Future<StorageStatusModel> getStorageStatus({String storageId}) {
    return repository<StorageStatusModel>(
      GetCheckIdAdapter(
        request: GetCheckIdRequest(
          storageId: storageId,
        ),
      ),
    );
  }
}
