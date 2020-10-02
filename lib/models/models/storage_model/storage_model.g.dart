// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorageModel _$StorageModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('StorageModel', json, () {
    final val = StorageModel(
      lastUpdate: $checkedConvert(json, 'last_update', (v) => v as int),
      partnerLevel: $checkedConvert(json, 'partner_level', (v) => v as String),
      settings: $checkedConvert(json, 'settings',
          (v) => v == null ? null : SettingsModel.fromJson(v)),
      data: $checkedConvert(
          json, 'data', (v) => v == null ? null : DataModel.fromJson(v)),
    );
    return val;
  }, fieldKeyMap: const {
    'lastUpdate': 'last_update',
    'partnerLevel': 'partner_level'
  });
}

Map<String, dynamic> _$StorageModelToJson(StorageModel instance) =>
    <String, dynamic>{
      'last_update': instance.lastUpdate,
      'partner_level': instance.partnerLevel,
      'settings': instance.settings?.toJson(),
      'data': instance.data?.toJson(),
    };
