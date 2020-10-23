import 'package:my_catalog/adapters/post_update_token_adapter.dart';
import 'package:my_catalog/models/models/update_token_status_model.dart';
import 'package:my_catalog/network/requests/post_update_token_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';
import 'package:my_catalog/services/device_info_service/device_info_service.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/push_notifications_service/push_notifications_service.dart';

/// This repository does work with all in app notifications.
/// Methods:
///   - [updateToken]. This functions need for update token on the server.
///   - params: [id] - id of selected catalog, [language] - selected locale
class NotificationsRepository extends Repository {
  Future<BaseHttpResponse<UpdateTokenStatusModel>> updateToken({int id, String language}) async {
    return repository<BaseHttpResponse<UpdateTokenStatusModel>>(
      PostUpdateTokenAdapter(
        request: PostUpdateTokenRequest(
          id: id,
          language: language,
          deviceId: await DeviceInfoService.instance.getDeviceId(),
          pushToken: await PushNotificationsService.instance.getFCMToken,
        ),
      ),
    );
  }
}
