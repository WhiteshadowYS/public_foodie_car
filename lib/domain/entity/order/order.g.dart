// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$_$_OrderFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Order', json, () {
    final val = _$_Order(
      id: $checkedConvert(json, 'id', (v) => v as num),
      products: $checkedConvert(
          json,
          'prducts',
          (v) => (v as List)
              ?.map((e) => e == null
                  ? null
                  : Product.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'products': 'prducts'});
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'prducts': instance.products?.map((e) => e?.toJson())?.toList(),
    };
