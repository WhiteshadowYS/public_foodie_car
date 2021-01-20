import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_page_language.g.dart';
part 'categories_page_language.freezed.dart';

@freezed
abstract class CategoriesPageLanguage with _$CategoriesPageLanguage {
  @JsonSerializable()
  const factory CategoriesPageLanguage({
    @required String title,
  }) = _CategoriesPageLanguage;

  factory CategoriesPageLanguage.fromJson(Map json) => _$CategoriesPageLanguageFromJson(json);
}
