import 'package:foodie_client_template/data/local/city_storage.dart';
import 'package:foodie_client_template/data/local/langauge_storage.dart';
import 'package:foodie_client_template/dictionary/models/supported_language.dart';
import 'package:foodie_client_template/domain/data_services/language_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LanguageService)
class LanguageServiceImpl implements LanguageService {
  final LanguageStorage _storage;

  LanguageServiceImpl(
    this._storage,
  );

  @override
  Future<SupportedLanguage> getLanguage() async => await _storage.getSupportedLanguage();

  @override
  Future<void> saveLanguage(SupportedLanguage language) async => _storage.postSupportedLanguage(language);
}
