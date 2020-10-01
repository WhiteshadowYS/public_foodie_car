import 'package:my_catalog/adapters/get_data_adapter.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';

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
}
