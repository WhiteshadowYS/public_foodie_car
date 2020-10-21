import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:my_catalog/adapters/post_update_token_adapter.dart';
import 'package:my_catalog/models/models/update_token_status_model.dart';
import 'package:my_catalog/network/requests/post_update_token_request.dart';
import 'package:my_catalog/repositories/shared/repository.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/push_notifications_service/push_notifications_service.dart';

// TODO(Yuri): Update comment for this class after function implementation.
/// This repository does work with all in app notifications.
/// Methods:
///   - [updateToken]. This functions need for update token on the server.
///   * Need update params on this function.
class NotificationsRepository extends Repository {

  Future<BaseHttpResponse<UpdateTokenStatusModel>> updateToken({int id, String language}) async{
    return repository<BaseHttpResponse<UpdateTokenStatusModel>>(
      PostUpdateTokenAdapter(
        request: PostUpdateTokenRequest(
          id: id,
          language: language,
          deviceId: await getDeviceId(),
          pushToken: await PushNotificationsService.instance.getFCMToken,
        ),
      ),
    );
  }

  Future<String> getDeviceId() async{
    String deviceId;
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
        deviceId = build.androidId;  //UUID for Android
      } else if (Platform.isIOS) {
        final IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
        deviceId = data.identifierForVendor;  //UUID for iOS
      }
      return deviceId;
  }
}
