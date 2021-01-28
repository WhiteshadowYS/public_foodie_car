// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrdersResponse _$_$_OrdersResponseFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_OrdersResponse', json, () {
    final val = _$_OrdersResponse(
      error: $checkedConvert(json, 'error', (v) => v as String),
      orders: $checkedConvert(
          json,
          'data',
          (v) => (v as List)
              ?.map((e) =>
                  e == null ? null : Order.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'orders': 'data'});
}

Map<String, dynamic> _$_$_OrdersResponseToJson(_$_OrdersResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.orders?.map((e) => e?.toJson())?.toList(),
    };
