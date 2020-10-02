// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_catalog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRCatalogDto _$GDRCatalogDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRCatalogDto', json, () {
    final val = GDRCatalogDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      imageLink: $checkedConvert(json, 'image', (v) => v as String),
      languages:
          $checkedConvert(json, 'categories', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {'imageLink': 'image', 'languages': 'categories'});
}

Map<String, dynamic> _$GDRCatalogDtoToJson(GDRCatalogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageLink,
      'categories': instance.languages,
    };
