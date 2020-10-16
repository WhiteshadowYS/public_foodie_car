// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRFileDto _$GDRFileDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRFileDto', json, () {
    final val = GDRFileDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      type: $checkedConvert(json, 'type', (v) => v as String),
      file: $checkedConvert(json, 'file', (v) => v as String),
      languages:
          $checkedConvert(json, 'languages', (v) => v as Map<String, dynamic>),
    );
    return val;
  });
}

Map<String, dynamic> _$GDRFileDtoToJson(GDRFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'file': instance.file,
      'languages': instance.languages,
    };
