// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('ProductModel', json, () {
    final val = ProductModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      imageLink: $checkedConvert(json, 'image', (v) => v as String),
      galleryImagesLinks: $checkedConvert(json, 'gallery',
          (v) => (v as List)?.map((e) => e as String)?.toList()),
      languages:
          $checkedConvert(json, 'languages', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {
    'imageLink': 'image',
    'galleryImagesLinks': 'gallery'
  });
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageLink,
      'gallery': instance.galleryImagesLinks,
      'languages': instance.languages,
    };
