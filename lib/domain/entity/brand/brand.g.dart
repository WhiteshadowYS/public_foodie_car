// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Brand _$_$_BrandFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Brand', json, () {
    final val = _$_Brand(
      id: $checkedConvert(json, 'id', (v) => v as num),
      status: $checkedConvert(json, 'status', (v) => v as num),
      name: $checkedConvert(json, 'name', (v) => v as String),
      createdAt: $checkedConvert(json, 'created_at',
          (v) => v == null ? null : DateTime.parse(v as String)),
      updatedAt: $checkedConvert(json, 'updated_at',
          (v) => v == null ? null : DateTime.parse(v as String)),
      locations: $checkedConvert(
          json,
          'locations',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Location.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'createdAt': 'created_at', 'updatedAt': 'updated_at'});
}

Map<String, dynamic> _$_$_BrandToJson(_$_Brand instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'locations': instance.locations?.map((e) => e?.toJson())?.toList(),
    };
