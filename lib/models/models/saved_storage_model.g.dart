// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_storage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedStorageModel _$SavedStorageModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('SavedStorageModel', json, () {
    final val = SavedStorageModel(
      storage: $checkedConvert(
          json, 'storage', (v) => v == null ? null : StorageModel.fromJson(v)),
      locale: $checkedConvert(json, 'locale', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$SavedStorageModelToJson(SavedStorageModel instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'storage': instance.storage?.toJson(),
    };
