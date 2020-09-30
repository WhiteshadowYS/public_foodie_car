// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestDataDto _$GetDataRequestDataDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestDataDto', json, () {
    final val = GetDataRequestDataDto(
      hierarchy: $checkedConvert(json, 'hierarchy', (v) => v as List),
      data: $checkedConvert(json, 'data', (v) => v as List),
    );
    return val;
  });
}

Map<String, dynamic> _$GetDataRequestDataDtoToJson(
        GetDataRequestDataDto instance) =>
    <String, dynamic>{
      'hierarchy': instance.hierarchy,
      'data': instance.data,
    };
