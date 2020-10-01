// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('LanguageModel', json, () {
    final val = LanguageModel(
      name: $checkedConvert(json, 'name', (v) => v as String),
      code: $checkedConvert(json, 'code', (v) => v as String),
      flag: $checkedConvert(json, 'flag', (v) => v as String),
      direction: $checkedConvert(json, 'direction', (v) => v as String),
      isDefault: $checkedConvert(json, 'is_default', (v) => v as bool),
    );
    return val;
  }, fieldKeyMap: const {'isDefault': 'is_default'});
}

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
      'direction': instance.direction,
      'is_default': instance.isDefault,
    };
