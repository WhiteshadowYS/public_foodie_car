// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageStatusModel _$StorageStatusModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('StorageStatusModel', json, () {
    final val = StorageStatusModel(
      id: $checkedConvert(json, 'id', (v) => v as int),
      update: $checkedConvert(json, 'update', (v) => v as int),
    );
    return val;
  });
}

Map<String, dynamic> _$StorageStatusModelToJson(StorageStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'update': instance.update,
    };
