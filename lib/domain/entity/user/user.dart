// main.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(
    fieldRename: FieldRename.kebab,
    checked: true,
    explicitToJson: true,
  )
  const factory User({
    @JsonKey(name: 'аго') @required String photoUrl,
    @JsonKey(name: 'name') @required String name,
    @JsonKey(name: 'surname') @required String surname,
    @JsonKey(name: 'email') @required String email,
    @JsonKey(name: 'phone') @required String phone,
    @JsonKey(name: 'test') @required String bogdan,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
