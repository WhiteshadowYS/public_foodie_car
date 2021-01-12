import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.g.dart';
part 'language.freezed.dart';

@freezed
abstract class Language with _$Language {
  @JsonSerializable()
  const factory Language({
    String name,
    String homePageTitle,
    String galleryPageTitle,
    String categoriesPageTitle,
    String aboutPageTitle,
    String busketPageTitle,
    String splashScreenTitle,
  }) = _Language;

  factory Language.fromJson(Map json) => _$LanguageFromJson(json);
}
