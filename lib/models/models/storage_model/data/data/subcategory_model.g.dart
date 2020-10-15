// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryModel _$SubcategoryModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('SubcategoryModel', json, () {
    final val = SubcategoryModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      imageLink: $checkedConvert(json, 'image', (v) => v as String),
      languages:
          $checkedConvert(json, 'languages', (v) => v as Map<String, dynamic>),
    );
    return val;
  }, fieldKeyMap: const {'imageLink': 'image'});
}

Map<String, dynamic> _$SubcategoryModelToJson(SubcategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageLink,
      'languages': instance.languages,
    };
