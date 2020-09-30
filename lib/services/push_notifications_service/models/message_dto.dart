import 'package:my_catalog/services/push_notifications_service/res/consts.dart';

class MessageDto {
  final Map messageMap;

  MessageDto(this.messageMap);

  Map get messageData => messageMap[MESSAGE_DATA];

  Map get messageNotification => messageMap[MESSAGE_NOTIFICATION];

  dynamic get messageDataMessageId => messageData[MESSAGE_ID].toString();

  dynamic get messageNotificationMessageId => messageNotification[MESSAGE_ID].toString();

  dynamic get messageDataTitle => messageData[MESSAGE_TITLE].toString();

  dynamic get messageNotificationTitle => messageNotification[MESSAGE_TITLE].toString();

  dynamic get messageDataDescription => messageData[MESSAGE_DESCRIPTION];

  dynamic get messageNotificationDescription => messageNotification[MESSAGE_DESCRIPTION];

  dynamic get messageDataContent => messageData[MESSAGE_CONTENT];

  dynamic get messageNotificationContent => messageNotification[MESSAGE_CONTENT];

  dynamic get messageDataBody => messageData[MESSAGE_BODY];

  dynamic get messageNotificationBody => messageNotification[MESSAGE_BODY];

  dynamic get messageDataPushBody => messageData[MESSAGE_PUSH_BODY];

  dynamic get messageNotificationPushBody => messageNotification[MESSAGE_PUSH_BODY];

  dynamic get messageDataType => messageData[MESSAGE_TYPE];

  dynamic get messageNotificationType => messageNotification[MESSAGE_TYPE];

  Map get iosMessageData => messageMap[MESSAGE_APS];

  Map get iosMessageAlert => iosMessageData[MESSAGE_ALERT];

  dynamic get iosMessageAlertType => iosMessageAlert[MESSAGE_TYPE];

  dynamic get iosMessageAlertId => iosMessageAlert[MESSAGE_ID];

  dynamic get iosMessageType => messageMap[MESSAGE_TYPE];

  dynamic get iosMessageId => messageMap[MESSAGE_ID];

  dynamic get iosMessageAlertTitle => iosMessageAlert[MESSAGE_TITLE];

  dynamic get iosMessageTitle => messageMap[MESSAGE_TITLE];

  dynamic get iosMessagePushTitle => messageMap[MESSAGE_PUSH_TITLE];

  dynamic get iosMessageContent => messageMap[MESSAGE_CONTENT];

  dynamic get iosMessagePushBody => messageMap[MESSAGE_PUSH_BODY];

  dynamic get iosMessageBody => messageMap[MESSAGE_BODY];

  dynamic get iosMessageAlertBody => iosMessageAlert[MESSAGE_BODY];
}
