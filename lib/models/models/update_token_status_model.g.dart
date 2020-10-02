// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_token_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTokenStatusModel _$UpdateTokenStatusModelFromJson(
    Map<String, dynamic> json) {
  return $checkedNew('UpdateTokenStatusModel', json, () {
    final val = UpdateTokenStatusModel(
      status: $checkedConvert(json, 'status', (v) => v as bool),
    );
    return val;
  });
}

Map<String, dynamic> _$UpdateTokenStatusModelToJson(
        UpdateTokenStatusModel instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
