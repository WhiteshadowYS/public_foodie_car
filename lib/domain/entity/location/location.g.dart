// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$_$_LocationFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Location', json, () {
    final val = _$_Location(
      id: $checkedConvert(json, 'id', (v) => v as num),
      name: $checkedConvert(json, 'name', (v) => v as String),
      slug: $checkedConvert(json, 'slug', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
