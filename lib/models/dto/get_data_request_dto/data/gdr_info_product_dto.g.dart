// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_info_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRInfoProductDto _$GDRInfoProductDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRInfoProductDto', json, () {
    final val = GDRInfoProductDto(
      id: $checkedConvert(json, 'id', (v) => v as int),
      files: $checkedConvert(
          json, 'files', (v) => (v as List)?.map((e) => e as int)?.toList()),
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

Map<String, dynamic> _$GDRInfoProductDtoToJson(GDRInfoProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayed_in': instance.displayedIn,
      'files': instance.files,
    };
