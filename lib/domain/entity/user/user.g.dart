// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_User', json, () {
    final val = _$_User(
      id: $checkedConvert(json, 'id', (v) => v as num),
      name: $checkedConvert(json, 'name', (v) => v as String),
      email: $checkedConvert(json, 'email', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
