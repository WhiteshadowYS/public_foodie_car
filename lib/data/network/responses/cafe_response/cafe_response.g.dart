// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CafeResponse _$_$_CafeResponseFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_CafeResponse', json, () {
    final val = _$_CafeResponse(
      error: $checkedConvert(json, 'error', (v) => v as String),
      cafeList: $checkedConvert(
          json,
          'data',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : Cafe.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'cafeList': 'data'});
}

Map<String, dynamic> _$_$_CafeResponseToJson(_$_CafeResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.cafeList?.map((e) => e?.toJson())?.toList(),
    };
