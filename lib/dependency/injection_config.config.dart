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
import '../store/brands_state/brands_main_epic.dart';
import '../data/network/repositories/brands_repository.dart';
import '../domain/data_services/brands_service.dart';
import '../data/services/brands_service_impl.dart';
import '../data/local/langauge_storage.dart';
import '../data/network/repositories/products_repository.dart';
import '../domain/data_services/products_service.dart';
import '../data/services/products_service_impl.dart';
import 'third_party_module.dart';

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
  gh.factory<BrandsMainEpic>(() => BrandsMainEpic());
  gh.lazySingleton<BrandsRepository>(() => BrandsRepository());
  gh.lazySingleton<BrandsService>(
      () => BrandsServiceImpl(get<BrandsRepository>()));
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
  gh.lazySingleton<LanguageStorage>(
      () => LanguageStorage(get<FlutterSecureStorage>()));
  gh.lazySingleton<ProductsRepository>(() => ProductsRepository(get<Dio>()));
  gh.lazySingleton<ProductsService>(() => ProductsServiceImpl());
  return get;
}

class _$ThirdPartyModule extends ThirdPartyModule {}
