// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRSubcategoryDto _$GDRSubcategoryDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRSubcategoryDto', json, () {
    final val = GDRSubcategoryDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      imageLink: $checkedConvert(json, 'image', (v) => v as String),
      languages:
          $checkedConvert(json, 'languages', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {'imageLink': 'image'});
}

Map<String, dynamic> _$GDRSubcategoryDtoToJson(GDRSubcategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageLink,
      'languages': instance.languages,
    };
