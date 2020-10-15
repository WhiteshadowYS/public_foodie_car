// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogModel _$CatalogModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('CatalogModel', json, () {
    final val = CatalogModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      imageLink: $checkedConvert(json, 'image', (v) => v as String),
      languages:
          $checkedConvert(json, 'languages', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {'imageLink': 'image'});
}

Map<String, dynamic> _$CatalogModelToJson(CatalogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageLink,
      'languages': instance.languages,
    };
