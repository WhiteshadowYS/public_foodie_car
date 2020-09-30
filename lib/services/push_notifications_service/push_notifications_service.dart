import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_catalog/services/push_notifications_service/models/message.dart';
import 'package:my_catalog/services/push_notifications_service/models/message_dto.dart';
import 'package:my_catalog/services/push_notifications_service/res/consts.dart';

class PushNotificationsService {
  static const tag = '[PushNotificationsService]';

  PushNotificationsService._privateConstructor();

  static final PushNotificationsService _instance = PushNotificationsService._privateConstructor();

  static PushNotificationsService get instance => _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Message _currentMessage;
  final List<Message> _unreadNotificationsList = [];

  Future<String> get getFCMToken async => await _firebaseMessaging.getToken();

  List<Message> get getUnreadNotificationsList => _unreadNotificationsList;

  // region [_onAllMessages]
  // ignore: missing_return
  Future<void> _onAllMessages(Message message, String type) {
    print('$tag => <_onAllMessages> => message: $message');
    if (_currentMessage?.id != message.id && _unreadNotificationsList.indexWhere((e) => e.id == message.id) == -1) {
      _currentMessage = message;

      if (type == ON_RESUME || type == ON_LAUNCH) {
        _unreadNotificationsList.add(message);
      }

      _handleCurrentMessage(type);
    }
  }
  // endregion

  // region [initialiseFCM]
  void initialiseFCM() async {
    try {
      if (await _firebaseMessaging.autoInitEnabled() == false) {
        await _firebaseMessaging.setAutoInitEnabled(true);
      }

      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) => _onAllMessages(Message(MessageDto(message)), ON_MESSAGE),
        onResume: (Map<String, dynamic> message) => _onAllMessages(Message(MessageDto(message)), ON_RESUME),
        onLaunch: (Map<String, dynamic> message) => _onAllMessages(Message(MessageDto(message)), ON_LAUNCH),
      );

      _firebaseMessaging.requestNotificationPermissions();
    } catch (e) {
      print('$tag -> <initialiseFCM> -> catch error -> $e');
    }
  }

  // endregion

  void _handleCurrentMessage(String type) {
    // TODO add popup
  }

  void clearUnreadNotificationsList() => _unreadNotificationsList.clear();
}