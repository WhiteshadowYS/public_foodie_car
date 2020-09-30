// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestInfoDto _$GetDataRequestInfoDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestInfoDto', json, () {
    final val = GetDataRequestInfoDto(
      logoImage: $checkedConvert(json, 'logo_img', (v) => v as String),
      text: $checkedConvert(json, 'text', (v) => v as String),
      title: $checkedConvert(json, 'title', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'logoImage': 'logo_img'});
}

Map<String, dynamic> _$GetDataRequestInfoDtoToJson(
        GetDataRequestInfoDto instance) =>
    <String, dynamic>{
      'logo_img': instance.logoImage,
      'title': instance.title,
      'text': instance.text,
    };
