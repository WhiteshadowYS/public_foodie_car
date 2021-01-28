import 'package:foodie_car_template/dictionary/models/supported_language.dart';

abstract class LanguageService {
  Future<void> saveLanguage(SupportedLanguage language);
  Future<SupportedLanguage> getLanguage();
}
