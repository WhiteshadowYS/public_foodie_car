// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_info_catalog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRInfoCatalogDto _$GDRInfoCatalogDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRInfoCatalogDto', json, () {
    final val = GDRInfoCatalogDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      categories: $checkedConvert(
          json,
          'categories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRInfoCategoryDto.fromJson(e))
              ?.toList()),
      displayedIn: $checkedConvert(json, 'displayed_in',
          (v) => (v as List)?.map((e) => e as String)?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'displayedIn': 'displayed_in'});
}

Map<String, dynamic> _$GDRInfoCatalogDtoToJson(GDRInfoCatalogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'categories': instance.categories?.map((e) => e?.toJson())?.toList(),
    };
