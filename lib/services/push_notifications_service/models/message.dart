import 'dart:io';

import 'package:my_catalog/services/push_notifications_service/models/message_dto.dart';
import 'package:my_catalog/services/push_notifications_service/res/consts.dart';

class Message {
  static const String TAG = '[Message]';

  String _id = EMPTY_STRING;
  String _title = EMPTY_STRING;
  String _body = EMPTY_STRING;
  String _type = EMPTY_STRING;
  Map _data = {};

  String get id => _id;

  String get title => _title;

  String get body => _body;

  String get type => _type;

  Map get data => _data;

  Message(MessageDto incomingMessage) {
    print('$TAG => <constructor> => incomingMessage: ${incomingMessage.messageMap}');

    if (Platform.isAndroid) {
      if (incomingMessage.messageData == null && incomingMessage.messageNotification == null) {
        _id = EMPTY_STRING;
        _title = EMPTY_STRING;
        _body = EMPTY_STRING;
        _type = EMPTY_STRING;
        _data = {};
      } else if (incomingMessage.messageNotification != null && incomingMessage.messageData == null) {
        _id = incomingMessage.messageNotificationMessageId ?? EMPTY_STRING;
        _title = incomingMessage.messageNotificationTitle ?? EMPTY_STRING;
        _body = incomingMessage.messageNotificationPushBody ?? EMPTY_STRING;
        _type = incomingMessage.messageNotificationType ?? EMPTY_STRING;
        _data = incomingMessage.messageData ?? {};
      } else if (incomingMessage.messageNotification == null || incomingMessage.messageNotification.isEmpty) {
        _id = incomingMessage.messageDataMessageId ?? incomingMessage.messageNotificationMessageId ?? EMPTY_STRING;

        _type = incomingMessage.messageDataType ?? incomingMessage.messageNotificationType ?? EMPTY_STRING;

        _title = incomingMessage.messageDataTitle ?? EMPTY_STRING;

        _body = incomingMessage.messageDataBody ??
            incomingMessage.messageDataDescription ??
            incomingMessage.messageDataContent ??
            incomingMessage.messageDataPushBody ??
            incomingMessage.messageNotificationBody ??
            EMPTY_STRING;

        _data = incomingMessage.messageData ?? {};
      } else {
        _id = incomingMessage.messageDataMessageId ?? incomingMessage.messageNotificationMessageId ?? EMPTY_STRING;
        _title = incomingMessage.messageDataTitle ?? incomingMessage.messageNotificationTitle ?? EMPTY_STRING;
        _type = incomingMessage.messageDataType ?? incomingMessage.messageNotificationType ?? EMPTY_STRING;
        _body = incomingMessage.messageDataDescription ??
            incomingMessage.messageDataBody ??
            incomingMessage.messageDataContent ??
            incomingMessage.messageDataPushBody ??
            incomingMessage.messageNotificationPushBody ??
            EMPTY_STRING;
        _data = incomingMessage.messageData ?? incomingMessage.messageNotification ?? {};
      }
    } else if (Platform.isIOS) {
      if (incomingMessage.iosMessageData != null || incomingMessage.iosMessageAlert != null) {
        _type = incomingMessage.iosMessageType ?? incomingMessage.iosMessageAlertType ?? EMPTY_STRING;
        _id = incomingMessage.iosMessageId ?? incomingMessage.iosMessageAlertId ?? EMPTY_STRING;
        _title = incomingMessage.iosMessageTitle ?? incomingMessage.iosMessagePushTitle ?? EMPTY_STRING;
        _body = incomingMessage.iosMessagePushBody ?? incomingMessage.iosMessageBody ?? EMPTY_STRING;
      } else {
        _title = incomingMessage.iosMessageAlertTitle ?? incomingMessage.iosMessageTitle ?? incomingMessage.iosMessagePushTitle ?? EMPTY_STRING;
        _body = incomingMessage.iosMessagePushBody ??
            incomingMessage.iosMessageBody ??
            incomingMessage.iosMessageContent ??
            incomingMessage.iosMessageAlertBody ??
            EMPTY_STRING;
      }
    }
  }
}
