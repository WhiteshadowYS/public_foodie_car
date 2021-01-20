// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$_$_CategoryFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Category', json, () {
    final val = _$_Category(
      id: $checkedConvert(json, 'id', (v) => v as num),
      status: $checkedConvert(json, 'status', (v) => v as num),
      name: $checkedConvert(json, 'name', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      imageUrl: $checkedConvert(json, 'image_url', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'imageUrl': 'image_url'});
}

Map<String, dynamic> _$_$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
    };
