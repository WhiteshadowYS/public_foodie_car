// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('MessageDto', json, () {
    final val = MessageDto(
      id: $checkedConvert(json, 'id', (v) => v as String),
      title: $checkedConvert(json, 'title', (v) => v as String),
      body: $checkedConvert(json, 'body', (v) => v as String),
      image: $checkedConvert(json, 'image', (v) => v as String),
      type: $checkedConvert(json, 'type', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$MessageDtoToJson(MessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'image': instance.image,
      'type': instance.type,
    };
