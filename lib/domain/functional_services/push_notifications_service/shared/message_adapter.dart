import 'dart:io';

import 'package:base_project_template/domain/functional_services/push_notifications_service/interfaces/i_message.dart';
import 'package:base_project_template/domain/functional_services/push_notifications_service/models/dtos/message_dto.dart';
import 'package:base_project_template/domain/functional_services/push_notifications_service/models/message.dart';
import 'package:base_project_template/domain/functional_services/push_notifications_service/res/consts.dart';

class MessageAdapter {
  static const String TAG = '[MessageAdapter]';

  IMessage incomingNotificationToMessage(Map<String, dynamic> messageMap) {
    MessageDto message;

    if (Platform.isAndroid) {
      if (messageMap[NOTIFICATION] != null && messageMap[NOTIFICATION][DATA] != null) {
        message = MessageDto.fromJson(messageMap[NOTIFICATION][DATA]);
      }
    }

    if (Platform.isIOS) {
      if (messageMap[APS] != null && messageMap[APS][DATA] != null) {
        message = MessageDto.fromJson(messageMap[APS][DATA]);
      }
    }

    return Message(
      id: message.id,
      title: message.title,
      content: message.body,
      imageUrl: message.image,
      type: message.type,
    );
  }
}
