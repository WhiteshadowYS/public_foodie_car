import 'dart:io';

import 'package:base_project_template/res/const.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';

/// [DeviceInfoService] it is service for getting device data.
/// This class it - Singleton, for function using use [DeviceInfoService.instance]
/// [getDeviceId] - function for getting UUID for Android or iOS device

class DeviceInfoService {
  static const tag = '[DeviceInfoService]';

  DeviceInfoService._privateConstructor();

  static final DeviceInfoService _instance = DeviceInfoService._privateConstructor();

  static DeviceInfoService get instance => _instance;

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  /// This function displays the current version of the application in the console.
  ///The [versionName] option will return the current weight of the application.
  ///The [versionCode] option will return the current application version code.
  ///The [versionPlatform] parameter will return the current platform.
  Future<String> getApplicationVersion() async {
    String versionName;
    String versionCode;
    String versionPlatform;

    try {
      versionName = await GetVersion.projectVersion;
    } on PlatformException {
      logger.e('Failed to get project version.');
      versionName = null;
    }

    try {
      versionCode = await GetVersion.projectCode;
    } on PlatformException {
      logger.e('Failed to get code version.');
      versionCode = null;
    }

    try {
      versionPlatform = await GetVersion.platformVersion;
    } on PlatformException {
      logger.e('Failed to get platform version.');
      versionPlatform = null;
    }

    logger.i('application version: $versionPlatform \n $versionName + $versionCode');

    return '$versionPlatform \n $versionName + $versionCode';
  }

  Future<String> getDeviceId() async {
    String deviceId;
    if (Platform.isAndroid) {
      final AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      deviceId = build.androidId;

      ///UUID for Android
    } else if (Platform.isIOS) {
      final IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
      deviceId = data.identifierForVendor;

      ///UUID for iOS
    }
    return deviceId;
  }
}
