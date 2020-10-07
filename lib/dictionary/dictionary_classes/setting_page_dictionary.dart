import 'package:flutter/foundation.dart';

class SettingPageDictionary {
  final String settings;
  final String pushNotification;
  final String language;
  final String terms;
  final String appVersion;
  final String createBy;

  const SettingPageDictionary({
    @required this.language,
    @required this.appVersion,
    @required this.createBy,
    @required this.pushNotification,
    @required this.settings,
    @required this.terms,
  });
}
