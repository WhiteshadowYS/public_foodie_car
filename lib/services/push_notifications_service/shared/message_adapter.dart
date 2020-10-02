import 'dart:io';

import 'package:my_catalog/services/push_notifications_service/interfaces/i_message.dart';
import 'package:my_catalog/services/push_notifications_service/models/message.dart';
import 'package:my_catalog/services/push_notifications_service/models/message_dto.dart';
import 'package:my_catalog/services/push_notifications_service/res/consts.dart';

class MessageAdapter {
  static const String TAG = '[Message]';

  IMessage incomingNotificationToMessage(MessageDto incomingMessage) {
    print('$TAG => <incomingNotificationToMessage> => incomingMessage: ${incomingMessage.messageMap}');

    String _id = EMPTY_STRING;
    String _title = EMPTY_STRING;
    String _body = EMPTY_STRING;
    String _imageUrl = EMPTY_STRING;
    String _type = EMPTY_STRING;

    if (Platform.isAndroid) {
      if (incomingMessage.messageData == null && incomingMessage.messageNotification == null) {
        _id = EMPTY_STRING;
        _title = EMPTY_STRING;
        _body = EMPTY_STRING;
        _type = EMPTY_STRING;
        _imageUrl = EMPTY_STRING;
      } else if (incomingMessage.messageNotification != null) {
        _id = incomingMessage.messageNotificationMessageId ?? EMPTY_STRING;
        _title = incomingMessage.messageNotificationTitle ?? EMPTY_STRING;
        _body = incomingMessage.messageNotificationPushBody ?? incomingMessage.messageNotificationBody ?? EMPTY_STRING;
        _type = incomingMessage.messageNotificationType ?? EMPTY_STRING;
        _imageUrl = incomingMessage.messageNotificationImageUrl ?? EMPTY_STRING;
      } else {
        _id = incomingMessage.messageDataMessageId ?? incomingMessage.messageNotificationMessageId ?? EMPTY_STRING;
        _title = incomingMessage.messageDataTitle ?? incomingMessage.messageNotificationTitle ?? EMPTY_STRING;
        _type = incomingMessage.messageDataType ?? incomingMessage.messageNotificationType ?? EMPTY_STRING;
        _imageUrl = incomingMessage.messageDataImageUrl ?? incomingMessage.messageNotificationImageUrl ?? EMPTY_STRING;
        _body = incomingMessage.messageDataDescription ??
            incomingMessage.messageDataBody ??
            incomingMessage.messageDataContent ??
            incomingMessage.messageDataPushBody ??
            incomingMessage.messageNotificationPushBody ??
            EMPTY_STRING;
      }
    }

    if (Platform.isIOS) {
        _type = incomingMessage.iosMessageAlertType ?? EMPTY_STRING;
        _id = incomingMessage.iosMessageAlertId ?? EMPTY_STRING;
        _title = incomingMessage.iosMessageAlertTitle ?? EMPTY_STRING;
        _body = incomingMessage.iosMessageAlertBody ?? EMPTY_STRING;
        _imageUrl = incomingMessage.iosMessageAlertImageUrl ?? EMPTY_STRING;
    }

    return Message(
      id: _id,
      title: _title,
      content: _body,
      imageUrl: _imageUrl,
      type: _type,
    );
  }
}