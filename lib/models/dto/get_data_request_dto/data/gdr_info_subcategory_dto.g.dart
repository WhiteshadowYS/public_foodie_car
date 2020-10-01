// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_info_subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRInfoSubcategoryDto _$GDRInfoSubcategoryDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('GDRInfoSubcategoryDto', json, () {
    final val = GDRInfoSubcategoryDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      products: $checkedConvert(
          json,
          'products',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRInfoProductDto.fromJson(e))
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

Map<String, dynamic> _$GDRInfoSubcategoryDtoToJson(
        GDRInfoSubcategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'products': instance.products?.map((e) => e?.toJson())?.toList(),
    };
