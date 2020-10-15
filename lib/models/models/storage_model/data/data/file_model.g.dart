// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('FileModel', json, () {
    final val = FileModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      type: $checkedConvert(json, 'type', (v) => v as String),
      imageLink: $checkedConvert(json, 'image', (v) => v as String),
      languages:
          $checkedConvert(json, 'languages', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {'imageLink': 'image'});
}

Map<String, dynamic> _$FileModelToJson(FileModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'image': instance.imageLink,
      'languages': instance.languages,
    };
