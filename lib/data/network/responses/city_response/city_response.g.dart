// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CityResponse _$_$_CityResponseFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_CityResponse', json, () {
    final val = _$_CityResponse(
      error: $checkedConvert(json, 'error', (v) => v as String),
      cityList: $checkedConvert(
          json,
          'data',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : City.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'cityList': 'data'});
}

Map<String, dynamic> _$_$_CityResponseToJson(_$_CityResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.cityList?.map((e) => e?.toJson())?.toList(),
    };
