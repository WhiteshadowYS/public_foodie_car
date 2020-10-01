// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_second_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRSecondDataDto _$GDRSecondDataDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRSecondDataDto', json, () {
    final val = GDRSecondDataDto(
      catalogs: $checkedConvert(
          json,
          'catalogs',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRCatalogDto.fromJson(e))
              ?.toList()),
      categories: $checkedConvert(
          json,
          'categories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRCategoryDto.fromJson(e))
              ?.toList()),
      subcategories: $checkedConvert(
          json,
          'subcategories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRSubcategoryDto.fromJson(e))
              ?.toList()),
      products: $checkedConvert(
          json,
          'products',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRProductDto.fromJson(e))
              ?.toList()),
      files: $checkedConvert(
          json,
          'files',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRFileDto.fromJson(e))
              ?.toList()),
    );
    return val;
  });
}

Map<String, dynamic> _$GDRSecondDataDtoToJson(GDRSecondDataDto instance) =>
    <String, dynamic>{
      'catalogs': instance.catalogs?.map((e) => e?.toJson())?.toList(),
      'categories': instance.categories?.map((e) => e?.toJson())?.toList(),
      'subcategories':
          instance.subcategories?.map((e) => e?.toJson())?.toList(),
      'products': instance.products?.map((e) => e?.toJson())?.toList(),
      'files': instance.files?.map((e) => e?.toJson())?.toList(),
    };
