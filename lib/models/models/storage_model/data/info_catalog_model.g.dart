// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoCatalogModel _$InfoCatalogModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('InfoCatalogModel', json, () {
    final val = InfoCatalogModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      categories: $checkedConvert(
          json,
          'categories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : InfoCategoryModel.fromJson(e))
              ?.toList()),
      displayedIn: $checkedConvert(
          json,
          'displayed_in',
          (v) => (v as List)
              ?.map((e) => (e as Map<String, dynamic>)?.map(
                    (k, e) => MapEntry(k, e as String),
                  ))
              ?.toList()),
    );
    return val;
  }, fieldKeyMap: const {'displayedIn': 'displayed_in'});
}

Map<String, dynamic> _$InfoCatalogModelToJson(InfoCatalogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'categories': instance.categories?.map((e) => e?.toJson())?.toList(),
    };
