// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_City _$_$_CityFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_City', json, () {
    final val = _$_City(
      id: $checkedConvert(json, 'id', (v) => v as num),
      name: $checkedConvert(json, 'name', (v) => v as String),
      slug: $checkedConvert(json, 'slug', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_CityToJson(_$_City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
