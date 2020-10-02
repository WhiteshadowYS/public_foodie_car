import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/notification_dialog.dart';
import 'package:my_catalog/services/push_notifications_service/models/message.dart';
import 'package:my_catalog/services/push_notifications_service/models/message_dto.dart';
import 'package:my_catalog/services/push_notifications_service/res/consts.dart';
import 'package:my_catalog/services/push_notifications_service/shared/message_adapter.dart';

/// [PushNotificationsService] it is service for control dialogs.
/// This class it - Singleton, for function using use [PushNotificationsService.instance]
/// - For init service use method [init] in [PushNotificationsService].
/// - For get get FCM token you can use [getFCMToken] getter.
/// - For get unread messages you can use [getUnreadNotificationsList] getter.
/// - For clear unread messages you can use [clearUnreadNotificationsList] method.
class PushNotificationsService {
  static const tag = '[PushNotificationsService]';

  PushNotificationsService._privateConstructor();

  static final PushNotificationsService _instance = PushNotificationsService._privateConstructor();

  static PushNotificationsService get instance => _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  /// A variable that stores all [Message] received
  /// when the application is turned off or roll upped.
  final List<Message> _unreadNotificationsList = [];

  /// A variable that stores current [Message] message.
  /// It is necessary to check the following message for duplicate
  Message _currentMessage;

  /// A [String] type getter that returns current [_firebaseMessaging] token
  Future<String> get getFCMToken async => await _firebaseMessaging.getToken();

  /// A [Message] type getter that returns current [_unreadNotificationsList]
  List<Message> get getUnreadNotificationsList => _unreadNotificationsList;

  // region [_onAllMessages]
  /// [_onAllMessage] used for type and duplicate test
  /// Works if [type] not equals to [_currentMessage] id
  /// or id of any [_unreadNotificationsList] notification
  /// If type of received notification [ON_RESUME] or [ON_LAUNCH] save
  /// notification to [_unreadNotificationsList]
  /// In other cases use [_handleCurrentMessage] to do
  /// something you need with received [Message]
  // ignore: missing_return
  Future<void> _onAllMessages(Message message, String type) {
    print('$tag => <_onAllMessages> => message: ${message.id}');
    if (message.id == EMPTY_STRING || (_currentMessage?.id != message.id && _unreadNotificationsList.indexWhere((e) => e.id == message.id) == -1)) {
      _currentMessage = message;

      if (type == ON_RESUME || type == ON_LAUNCH) {
        _unreadNotificationsList.add(message);
      }

      _handleCurrentMessage(message);
    }
  }
  // endregion

  // region [initialise]
  /// [init] method used to initialize [_firebaseMessaging].
  /// [onMessage] configuration used to receive [message] if opened app
  /// [onLaunch] configuration used to receive [message] if closed app
  /// [onResume] configuration used to receive [message] if rolled up app
  void init() async {
    try {
      if (await _firebaseMessaging.autoInitEnabled() == false) {
        await _firebaseMessaging.setAutoInitEnabled(true);
      }

      final MessageAdapter _adapter = MessageAdapter();

      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) => _onAllMessages(_adapter.incomingNotificationToMessage(MessageDto(message)), ON_MESSAGE),
        onResume: (Map<String, dynamic> message) => _onAllMessages(_adapter.incomingNotificationToMessage(MessageDto(message)), ON_RESUME),
        onLaunch: (Map<String, dynamic> message) => _onAllMessages(_adapter.incomingNotificationToMessage(MessageDto(message)), ON_LAUNCH),
      );

      _firebaseMessaging.requestNotificationPermissions();
    } catch (e) {
      print('$tag -> <initialiseFCM> -> catch error -> $e');
    }
  }
  // endregion

  /// [_handleCurrentMessage] method used to show [NotificationDialog]
  void _handleCurrentMessage(Message message) {
    DialogService.instance.show(NotificationDialog(
      title: message.title,
      message: message.content,
      logoUrl: message.imageUrl,
    ));
  }

  /// [clearUnreadNotificationsList] used to clear [_unreadNotificationsList]
  void clearUnreadNotificationsList() => _unreadNotificationsList.clear();
}