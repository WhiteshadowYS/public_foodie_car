// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_info_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRInfoCategoryDto _$GDRInfoCategoryDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRInfoCategoryDto', json, () {
    final val = GDRInfoCategoryDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      subcategories: $checkedConvert(
          json,
          'sub_categories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRInfoSubcategoryDto.fromJson(e))
              ?.toList()),
      displayedIn: $checkedConvert(json, 'displayed_in',
          (v) => (v as List)?.map((e) => e as String)?.toList()),
    );
    return val;
  }, fieldKeyMap: const {
    'subcategories': 'sub_categories',
    'displayedIn': 'displayed_in'
  });
}

Map<String, dynamic> _$GDRInfoCategoryDtoToJson(GDRInfoCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'sub_categories':
          instance.subcategories?.map((e) => e?.toJson())?.toList(),
    };
