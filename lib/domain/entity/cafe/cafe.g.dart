// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cafe _$_$_CafeFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Cafe', json, () {
    final val = _$_Cafe(
      id: $checkedConvert(json, 'id', (v) => v as num),
      status: $checkedConvert(json, 'status', (v) => v as num),
      name: $checkedConvert(json, 'name', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      imageUrl: $checkedConvert(json, 'imageUrl', (v) => v as String),
      locations: $checkedConvert(
          json,
          'locations',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : City.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_CafeToJson(_$_Cafe instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'locations': instance.locations?.map((e) => e?.toJson())?.toList(),
    };
