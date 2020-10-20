import 'package:my_catalog/adapters/post_update_token_adapter.dart';
import 'package:my_catalog/models/models/update_token_status_model.dart';
import 'package:my_catalog/network/requests/post_update_token_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';

// TODO(Yuri): Update comment for this class after function implementation.
/// This repository does work with all in app notifications.
/// Methods:
///   - [updateToken]. This functions need for update token on the server.
///   * Need update params on this function.
class NotificationsRepository extends Repository {
  Future<UpdateTokenStatusModel> updateToken({int id}) {
    return repository<UpdateTokenStatusModel>(
      PostUpdateTokenAdapter(
        request: PostUpdateTokenRequest(
          id: id,
          language: '',
          deviceId: '',
          pushToken: '',
        ),
      ),
    );
  }
}
