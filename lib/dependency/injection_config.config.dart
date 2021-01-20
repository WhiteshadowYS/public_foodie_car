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
import '../data/network/repositories/cafe_repository.dart';
import '../domain/data_services/cafe_service.dart';
import '../data/services/cafe_service_impl.dart';
import '../data/local/cafe_storage.dart';
import '../data/network/repositories/categories_repository.dart';
import '../domain/data_services/categories_service.dart';
import '../data/services/category_service_impl.dart';
import '../data/local/categories_storage.dart';
import '../data/network/repositories/city_repository.dart';
import '../domain/data_services/city_service.dart';
import '../data/services/city_service_impl.dart';
import '../data/local/city_storage.dart';
import '../domain/data_services/language_service.dart';
import '../data/services/language_service_impl.dart';
import '../data/local/langauge_storage.dart';
import '../data/network/repositories/products_repository.dart';
import '../domain/data_services/products_service.dart';
import '../data/services/products_service_impl.dart';
import '../data/local/products_storage.dart';
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
  gh.lazySingleton<CafeRepository>(() => CafeRepository());
  gh.lazySingleton<CategoriesRepository>(() => CategoriesRepository());
  gh.lazySingleton<CityRepository>(() => CityRepository());
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
  gh.lazySingleton<ProductsRepository>(() => ProductsRepository());
  gh.lazySingleton<ProductsStorage>(
      () => ProductsStorage(get<FlutterSecureStorage>()));
  gh.lazySingleton<CafeStorage>(() => CafeStorage(get<FlutterSecureStorage>()));
  gh.lazySingleton<CategoriesStorage>(
      () => CategoriesStorage(get<FlutterSecureStorage>()));
  gh.lazySingleton<CityStorage>(() => CityStorage(get<FlutterSecureStorage>()));
  gh.lazySingleton<LanguageService>(
      () => LanguageServiceImpl(get<LanguageStorage>()));
  gh.lazySingleton<ProductsService>(() =>
      ProductsServiceImpl(get<ProductsRepository>(), get<ProductsStorage>()));
  gh.lazySingleton<CafeService>(
      () => CafeServiceImpl(get<CafeRepository>(), get<CafeStorage>()));
  gh.lazySingleton<CategoriesService>(() => CategoriesServiceImpl(
      get<CategoriesRepository>(), get<CategoriesStorage>()));
  gh.lazySingleton<CityService>(
      () => CityServiceImpl(get<CityRepository>(), get<CityStorage>()));
  return get;
}

class _$ThirdPartyModule extends ThirdPartyModule {}
