// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_data_request_second_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataRequestSecondDataDto _$GetDataRequestSecondDataDtoFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('GetDataRequestSecondDataDto', json, () {
    final val = GetDataRequestSecondDataDto(
      catalogs: $checkedConvert(json, 'catalogs', (v) => v as List),
      categories: $checkedConvert(json, 'categories', (v) => v as List),
      subcategories: $checkedConvert(json, 'subcategories', (v) => v as List),
      products: $checkedConvert(json, 'products', (v) => v as List),
      files: $checkedConvert(json, 'files', (v) => v as List),
    );
    return val;
  });
}

Map<String, dynamic> _$GetDataRequestSecondDataDtoToJson(
        GetDataRequestSecondDataDto instance) =>
    <String, dynamic>{
      'catalogs': instance.catalogs,
      'categories': instance.categories,
      'subcategories': instance.subcategories,
      'products': instance.products,
      'files': instance.files,
    };
