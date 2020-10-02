// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageStatusModel _$StorageStatusModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('StorageStatusModel', json, () {
    final val = StorageStatusModel(
      id: $checkedConvert(json, 'id', (v) => v as String),
      lastUpdate:
          $checkedConvert(json, 'last_update', (v) => (v as num)?.toDouble()),
    );
    return val;
  }, fieldKeyMap: const {'lastUpdate': 'last_update'});
}

Map<String, dynamic> _$StorageStatusModelToJson(StorageStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_update': instance.lastUpdate,
    };
