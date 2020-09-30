// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestDto _$GetDataRequestDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestDto', json, () {
    final val = GetDataRequestDto(
      lastUpdate: $checkedConvert(json, 'last_update', (v) => v as int),
      partnerLevel: $checkedConvert(json, 'partner_level', (v) => v as String),
      settings: $checkedConvert(json, 'settings', (v) => v as String),
      data: $checkedConvert(json, 'data', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'lastUpdate': 'last_update',
    'partnerLevel': 'partner_level'
  });
}

Map<String, dynamic> _$GetDataRequestDtoToJson(GetDataRequestDto instance) =>
    <String, dynamic>{
      'last_update': instance.lastUpdate,
      'partner_level': instance.partnerLevel,
      'settings': instance.settings,
      'data': instance.data,
    };
