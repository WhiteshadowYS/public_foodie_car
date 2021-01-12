// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BrandsResponse _$_$_BrandsResponseFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_BrandsResponse', json, () {
    final val = _$_BrandsResponse(
      error: $checkedConvert(json, 'error', (v) => v as String),
      brands: $checkedConvert(
          json,
          'data',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : Brand.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'brands': 'data'});
}

Map<String, dynamic> _$_$_BrandsResponseToJson(_$_BrandsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.brands?.map((e) => e?.toJson())?.toList(),
    };
