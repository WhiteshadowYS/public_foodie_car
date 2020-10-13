// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestDto _$GetDataRequestDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestDto', json, () {
    final val = GetDataRequestDto(
      partnerLevel: $checkedConvert(json, 'partner_level', (v) => v as String),
      settings: $checkedConvert(json, 'settings',
          (v) => v == null ? null : GDRSettingsDto.fromJson(v)),
      data: $checkedConvert(
          json, 'data', (v) => v == null ? null : GDRDataDto.fromJson(v)),
    );
    return val;
  }, fieldKeyMap: const {'partnerLevel': 'partner_level'});
}

Map<String, dynamic> _$GetDataRequestDtoToJson(GetDataRequestDto instance) =>
    <String, dynamic>{
      'partner_level': instance.partnerLevel,
      'settings': instance.settings?.toJson(),
      'data': instance.data?.toJson(),
    };
