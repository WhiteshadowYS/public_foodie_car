import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_language.g.dart';
part 'login_page_language.freezed.dart';

@freezed
abstract class LoginPageLanguage with _$LoginPageLanguage {
  @JsonSerializable()
  const factory LoginPageLanguage({
    @required String title,
    @required String emailHint,
    @required String passwordHint,
  }) = _LoginPageLanguage;

  factory LoginPageLanguage.fromJson(Map json) => _$LoginPageLanguageFromJson(json);
}
