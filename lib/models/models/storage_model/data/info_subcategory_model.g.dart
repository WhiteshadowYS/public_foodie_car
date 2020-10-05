// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_subcategory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoSubcategoryModel _$InfoSubcategoryModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('InfoSubcategoryModel', json, () {
    final val = InfoSubcategoryModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      products: $checkedConvert(
          json,
          'products',
          (v) => (v as List)
              ?.map((e) => e == null ? null : InfoProductModel.fromJson(e))
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

Map<String, dynamic> _$InfoSubcategoryModelToJson(
        InfoSubcategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'products': instance.products?.map((e) => e?.toJson())?.toList(),
    };
