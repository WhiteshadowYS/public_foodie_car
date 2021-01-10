// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import 'third_party_module.dart';
import '../data/network/repositories/user_repository.dart';
import '../domain/data_services/user_service.dart';
import '../data/services/user_service_impl.dart';
import '../data/local/user_storage.dart';

/// Environment names
const _dev = 'dev';
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyModule = _$ThirdPartyModule();
  gh.factory<AppConfig>(() => DevConfig(), registerFor: {_dev});
  gh.factory<AppConfig>(() => ProdConfig(), registerFor: {_prod});
  gh.lazySingleton<Dio>(
      () => thirdPartyModule.provideAuthorizedDio(
          get<AppConfig>(), get<String>()),
      instanceName: 'authorized');
  gh.lazySingleton<Dio>(
      () => thirdPartyModule.provideUnAuthorizedDio(
          get<AppConfig>(), get<String>()),
      instanceName: 'unauthorized');
  gh.lazySingleton<FirebaseMessaging>(() => thirdPartyModule.firebaseMessaging);
  gh.lazySingleton<FlutterSecureStorage>(
      () => thirdPartyModule.flutterSecureStorage);
  gh.lazySingleton<UserService>(() => UserServiceImpl());
  gh.lazySingleton<UserStorage>(() => UserStorage(get<FlutterSecureStorage>()));
  gh.lazySingleton<UserRepository>(() => UserRepository(
        get<Dio>(),
        get<UserService>(),
        get<UserStorage>(),
      ));
  return get;
}

class _$ThirdPartyModule extends ThirdPartyModule {}
