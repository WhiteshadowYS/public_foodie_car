import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfoService {
  static const tag = '[DeviceInfoService]';

  DeviceInfoService._privateConstructor();

  static final DeviceInfoService _instance = DeviceInfoService._privateConstructor();

  static DeviceInfoService get instance => _instance;

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> getDeviceId() async {
    String deviceId;
    if (Platform.isAndroid) {
      final AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      deviceId = build.androidId; //UUID for Android
    } else if (Platform.isIOS) {
      final IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
      deviceId = data.identifierForVendor; //UUID for iOS
    }
    return deviceId;
  }
}
