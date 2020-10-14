// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_check_id_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCheckIdRequestDto _$GetCheckIdRequestDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GetCheckIdRequestDto', json, () {
    final val = GetCheckIdRequestDto(
      update: $checkedConvert(json, 'update', (v) => v as int),
    );
    return val;
  });
}

Map<String, dynamic> _$GetCheckIdRequestDtoToJson(
        GetCheckIdRequestDto instance) =>
    <String, dynamic>{
      'update': instance.update,
    };
