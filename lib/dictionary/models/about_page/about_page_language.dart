import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_page_language.g.dart';
part 'about_page_language.freezed.dart';

@freezed
abstract class AboutPageLanguage with _$AboutPageLanguage {
  @JsonSerializable()
  const factory AboutPageLanguage({
    @required String title,
  }) = _AboutPageLanguage;

  factory AboutPageLanguage.fromJson(Map json) => _$AboutPageLanguageFromJson(json);
}
