// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Product', json, () {
    final val = _$_Product(
      id: $checkedConvert(json, 'id', (v) => v as num),
      title: $checkedConvert(json, 'title', (v) => v as String),
      description: $checkedConvert(json, 'description', (v) => v as String),
      price: $checkedConvert(json, 'price', (v) => v as num),
      weight: $checkedConvert(json, 'weight', (v) => v as num),
      imageUrl: $checkedConvert(json, 'String', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'imageUrl': 'String'});
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'weight': instance.weight,
      'String': instance.imageUrl,
    };
