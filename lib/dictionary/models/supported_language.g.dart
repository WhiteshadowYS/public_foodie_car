// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supported_language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportedLanguage _$SupportedLanguageFromJson(Map<String, dynamic> json) {
  return SupportedLanguage(
    languageCode: json['languageCode'] as String,
    language: json['language'] == null
        ? null
        : Language.fromJson(json['language'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SupportedLanguageToJson(SupportedLanguage instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'language': instance.language,
    };
