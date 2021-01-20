// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoriesResponse _$_$_CategoriesResponseFromJson(
    Map<String, dynamic> json) {
  return $checkedNew(r'_$_CategoriesResponse', json, () {
    final val = _$_CategoriesResponse(
      error: $checkedConvert(json, 'error', (v) => v as String),
      categories: $checkedConvert(
          json,
          'data',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Category.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'categories': 'data'});
}

Map<String, dynamic> _$_$_CategoriesResponseToJson(
        _$_CategoriesResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.categories?.map((e) => e?.toJson())?.toList(),
    };
