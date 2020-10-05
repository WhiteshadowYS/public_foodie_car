// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRDataDto _$GDRDataDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRDataDto', json, () {
    final val = GDRDataDto(
      hierarchy: $checkedConvert(
          json,
          'hierarchy',
          (v) => (v as List)
              ?.map((e) => e == null ? null : GDRInfoCatalogDto.fromJson(e))
              ?.toList()),
      data: $checkedConvert(
          json, 'data', (v) => v == null ? null : GDRSecondDataDto.fromJson(v)),
    );
    return val;
  });
}

Map<String, dynamic> _$GDRDataDtoToJson(GDRDataDto instance) =>
    <String, dynamic>{
      'hierarchy': instance.hierarchy?.map((e) => e?.toJson())?.toList(),
      'data': instance.data?.toJson(),
    };
