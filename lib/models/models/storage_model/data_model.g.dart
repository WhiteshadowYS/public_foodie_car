// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('DataModel', json, () {
    final val = DataModel(
      hierarchy: $checkedConvert(
          json,
          'hierarchy',
          (v) => (v as List)
              ?.map((e) => e == null ? null : InfoCatalogModel.fromJson(e))
              ?.toList()),
      data: $checkedConvert(
          json, 'data', (v) => v == null ? null : SecondDataModel.fromJson(v)),
    );
    return val;
  });
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'hierarchy': instance.hierarchy?.map((e) => e?.toJson())?.toList(),
      'data': instance.data?.toJson(),
    };
