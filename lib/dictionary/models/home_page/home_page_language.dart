import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_language.g.dart';
part 'home_page_language.freezed.dart';

@freezed
abstract class HomePageLanguage with _$HomePageLanguage {
  @JsonSerializable()
  const factory HomePageLanguage({
    @required String title,
  }) = _HomePageLanguage;

  factory HomePageLanguage.fromJson(Map json) => _$HomePageLanguageFromJson(json);
}
