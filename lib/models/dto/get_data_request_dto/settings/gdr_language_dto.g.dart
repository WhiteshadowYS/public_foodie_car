// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRLanguageDto _$GDRLanguageDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRLanguageDto', json, () {
    final val = GDRLanguageDto(
      name: $checkedConvert(json, 'name', (v) => v as String),
      code: $checkedConvert(json, 'code', (v) => v as String),
      flag: $checkedConvert(json, 'flag', (v) => v as String),
      direction: $checkedConvert(json, 'direction', (v) => v as String),
      isDefault: $checkedConvert(json, 'is_default', (v) => v as bool),
    );
    return val;
  }, fieldKeyMap: const {'isDefault': 'is_default'});
}

Map<String, dynamic> _$GDRLanguageDtoToJson(GDRLanguageDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
      'direction': instance.direction,
      'is_default': instance.isDefault,
    };
