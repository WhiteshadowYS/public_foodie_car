// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_User', json, () {
    final val = _$_User(
      photoUrl: $checkedConvert(json, 'аго', (v) => v as String),
      name: $checkedConvert(json, 'name', (v) => v as String),
      surname: $checkedConvert(json, 'surname', (v) => v as String),
      email: $checkedConvert(json, 'email', (v) => v as String),
      phone: $checkedConvert(json, 'phone', (v) => v as String),
      bogdan: $checkedConvert(json, 'test', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {'photoUrl': 'аго', 'bogdan': 'test'});
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'аго': instance.photoUrl,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
      'test': instance.bogdan,
    };
