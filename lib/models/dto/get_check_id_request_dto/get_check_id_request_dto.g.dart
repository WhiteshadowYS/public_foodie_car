// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_check_id_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCheckIdRequestDto _$GetCheckIdRequestDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GetCheckIdRequestDto', json, () {
    final val = GetCheckIdRequestDto(
      lastUpdate:
          $checkedConvert(json, 'last_update', (v) => (v as num)?.toDouble()),
    );
    return val;
  }, fieldKeyMap: const {'lastUpdate': 'last_update'});
}

Map<String, dynamic> _$GetCheckIdRequestDtoToJson(
        GetCheckIdRequestDto instance) =>
    <String, dynamic>{
      'last_update': instance.lastUpdate,
    };
