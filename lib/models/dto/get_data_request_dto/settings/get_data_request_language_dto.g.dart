// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestLanguageDto _$GetDataRequestLanguageDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestLanguageDto', json, () {
    final val = GetDataRequestLanguageDto(
      name: $checkedConvert(json, 'name', (v) => v as String),
      code: $checkedConvert(json, 'code', (v) => v as String),
      flag: $checkedConvert(json, 'flag', (v) => v as String),
      direction: $checkedConvert(json, 'direction', (v) => v as String),
      isDefault: $checkedConvert(json, 'is_default', (v) => v as bool),
    );
    return val;
  }, fieldKeyMap: const {'isDefault': 'is_default'});
}

Map<String, dynamic> _$GetDataRequestLanguageDtoToJson(
        GetDataRequestLanguageDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
      'direction': instance.direction,
      'is_default': instance.isDefault,
    };
