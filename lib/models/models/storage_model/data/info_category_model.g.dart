// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoCategoryModel _$InfoCategoryModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('InfoCategoryModel', json, () {
    final val = InfoCategoryModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      subcategories: $checkedConvert(
          json,
          'sub_categories',
          (v) => (v as List)
              ?.map((e) => e == null ? null : InfoSubcategoryModel.fromJson(e))
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
  }, fieldKeyMap: const {
    'subcategories': 'sub_categories',
    'displayedIn': 'displayed_in'
  });
}

Map<String, dynamic> _$InfoCategoryModelToJson(InfoCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'sub_categories':
          instance.subcategories?.map((e) => e?.toJson())?.toList(),
    };
