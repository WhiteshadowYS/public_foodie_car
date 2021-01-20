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
      category: $checkedConvert(json, 'category', (v) => v as String),
      price: $checkedConvert(json, 'price', (v) => v as String),
      weight: $checkedConvert(json, 'weight', (v) => v as num),
      baseImage: $checkedConvert(
          json,
          'base_image',
          (v) =>
              v == null ? null : BaseImage.fromJson(v as Map<String, dynamic>)),
      count: $checkedConvert(json, 'count', (v) => v as num) ?? 0,
    );
    return val;
  }, fieldKeyMap: const {'baseImage': 'base_image'});
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'weight': instance.weight,
      'base_image': instance.baseImage?.toJson(),
      'count': instance.count,
    };
