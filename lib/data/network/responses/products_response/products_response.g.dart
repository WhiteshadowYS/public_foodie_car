// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductsResponse _$_$_ProductsResponseFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_ProductsResponse', json, () {
    final val = _$_ProductsResponse(
      error: $checkedConvert(json, 'error', (v) => v as String),
      products: $checkedConvert(
          json,
          'data',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Product.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'products': 'data'});
}

Map<String, dynamic> _$_$_ProductsResponseToJson(
        _$_ProductsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.products?.map((e) => e?.toJson())?.toList(),
    };
