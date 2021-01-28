import 'package:foodie_car_template/config/app_config.dart';
import 'package:foodie_car_template/data/network/interceptors/curl_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _timeout = 10000;

@module
abstract class ThirdPartyModule {
  @Named('authorized')
  @lazySingleton
  Dio provideAuthorizedDio(AppConfig config, String token) => _getDio(config, token, true);

  @Named('unauthorized')
  @lazySingleton
  Dio provideUnAuthorizedDio(AppConfig config, String token) => _getDio(config, token, false);

  Dio _getDio(
    AppConfig config,
    String token,
    bool isAuthorized,
  ) {
    final dio = Dio(_dioOptions);
    dio.options.baseUrl = config.baseUrl;
    final loggers = [
      CurlInterceptor(),
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: false,
      ),
    ];
    return dio
      ..interceptors.addAll(
        [
          if (config.enableLogs) ...loggers,
        ],
      );
  }

  @lazySingleton
  @factoryMethod
  FlutterSecureStorage get flutterSecureStorage => FlutterSecureStorage();

  @lazySingleton
  @factoryMethod
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging();
}

BaseOptions get _dioOptions {
  return BaseOptions(
    connectTimeout: _timeout,
    receiveTimeout: _timeout,
    sendTimeout: _timeout,
  );
}
