import 'package:my_catalog/adapters/get_data_adapter.dart';
import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/adapters/post_update_token_adapter.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/models/models/update_token_status_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/network/requests/post_update_token_request.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';

/// This repository does work with all in app notifications.
/// Methods:
///   - [updateToken]. This functions need for update token on the server.
///   * Need update params on this function.
class NotificationsRepository extends Repository {
  Future<UpdateTokenStatusModel> updateToken({String storageId}) {
    return repository<UpdateTokenStatusModel>(
      PostUpdateTokenAdapter(
        request: PostUpdateTokenRequest(
          storageId: storageId,
          language: '',
          deviceId: '',
          pushToken: '',
        ),
      ),
    );
  }
}
