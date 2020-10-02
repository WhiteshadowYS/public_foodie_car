// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRInfoDto _$GDRInfoDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRInfoDto', json, () {
    final val = GDRInfoDto(
      logoImage: $checkedConvert(json, 'logo_img', (v) => v as String),
      text: $checkedConvert(json, 'text', (v) => v as String),
      title: $checkedConvert(json, 'title', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'logoImage': 'logo_img'});
}

Map<String, dynamic> _$GDRInfoDtoToJson(GDRInfoDto instance) =>
    <String, dynamic>{
      'logo_img': instance.logoImage,
      'title': instance.title,
      'text': instance.text,
    };
