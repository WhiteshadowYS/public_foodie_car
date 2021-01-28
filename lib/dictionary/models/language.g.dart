// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Language _$_$_LanguageFromJson(Map<String, dynamic> json) {
  return _$_Language(
    name: json['name'] as String,
    homePage: json['homePage'] == null
        ? null
        : HomePageLanguage.fromJson(json['homePage'] as Map<String, dynamic>),
    loginPage: json['loginPage'] == null
        ? null
        : LoginPageLanguage.fromJson(json['loginPage'] as Map<String, dynamic>),
    global: json['global'] == null
        ? null
        : GlobalLanguage.fromJson(json['global'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_LanguageToJson(_$_Language instance) =>
    <String, dynamic>{
      'name': instance.name,
      'homePage': instance.homePage,
      'loginPage': instance.loginPage,
      'global': instance.global,
    };
