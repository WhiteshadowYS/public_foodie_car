// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondDataModel _$SecondDataModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('SecondDataModel', json, () {
    final val = SecondDataModel(
      catalogs: $checkedConvert(
          json,
          'catalogs',
          (v) => (v as List)
              ?.map((e) => e == null ? null : CatalogModel.fromJson(e))
              ?.toList()),
      categories: $checkedConvert(
          json,
          'categories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : CategoryModel.fromJson(e))
              ?.toList()),
      subcategories: $checkedConvert(
          json,
          'subcategories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : SubcategoryModel.fromJson(e))
              ?.toList()),
      products: $checkedConvert(
          json,
          'products',
          (v) => (v as List)
              ?.map((e) => e == null ? null : ProductModel.fromJson(e))
              ?.toList()),
      files: $checkedConvert(
          json,
          'files',
          (v) => (v as List)
              ?.map((e) => e == null ? null : FileModel.fromJson(e))
              ?.toList()),
    );
    return val;
  });
}

Map<String, dynamic> _$SecondDataModelToJson(SecondDataModel instance) =>
    <String, dynamic>{
      'catalogs': instance.catalogs?.map((e) => e?.toJson())?.toList(),
      'categories': instance.categories?.map((e) => e?.toJson())?.toList(),
      'subcategories':
          instance.subcategories?.map((e) => e?.toJson())?.toList(),
      'products': instance.products?.map((e) => e?.toJson())?.toList(),
      'files': instance.files?.map((e) => e?.toJson())?.toList(),
    };
