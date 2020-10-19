// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRCategoryDto _$GDRCategoryDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRCategoryDto', json, () {
    final val = GDRCategoryDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      imageLink: $checkedConvert(json, 'image', (v) => v as String),
      languages:
          $checkedConvert(json, 'languages', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {'imageLink': 'image'});
}

Map<String, dynamic> _$GDRCategoryDtoToJson(GDRCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageLink,
      'languages': instance.languages,
    };
