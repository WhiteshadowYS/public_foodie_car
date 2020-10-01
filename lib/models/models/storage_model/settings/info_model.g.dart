// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('InfoModel', json, () {
    final val = InfoModel(
      logoImage: $checkedConvert(json, 'logo_img', (v) => v as String),
      text: $checkedConvert(json, 'text', (v) => v as String),
      title: $checkedConvert(json, 'title', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'logoImage': 'logo_img'});
}

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
      'logo_img': instance.logoImage,
      'title': instance.title,
      'text': instance.text,
    };
