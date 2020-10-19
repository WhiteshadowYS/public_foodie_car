// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRProductDto _$GDRProductDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRProductDto', json, () {
    final val = GDRProductDto(
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

Map<String, dynamic> _$GDRProductDtoToJson(GDRProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageLink,
      'gallery': instance.galleryImagesLinks,
      'languages': instance.languages,
    };
