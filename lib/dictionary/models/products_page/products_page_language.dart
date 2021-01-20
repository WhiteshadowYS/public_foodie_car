import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_page_language.g.dart';
part 'products_page_language.freezed.dart';

@freezed
abstract class ProductsPageLanguage with _$ProductsPageLanguage {
  @JsonSerializable()
  const factory ProductsPageLanguage({
    @required String title,
  }) = _ProductsPageLanguage;

  factory ProductsPageLanguage.fromJson(Map json) => _$ProductsPageLanguageFromJson(json);
}
