import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    checked: true,
    explicitToJson: true,
  )
  const factory User({
    @JsonKey(name: 'id') num id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'email') String email,
  }) = _User;

  factory User.fromJson(Map json) => _$UserFromJson(json);
}
