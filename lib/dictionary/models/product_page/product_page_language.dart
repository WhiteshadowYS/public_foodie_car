import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_page_language.g.dart';
part 'product_page_language.freezed.dart';

@freezed
abstract class ProductPageLanguage with _$ProductPageLanguage {
  @JsonSerializable()
  const factory ProductPageLanguage({
    @required String title,
  }) = _ProductPageLanguage;

  factory ProductPageLanguage.fromJson(Map json) => _$ProductPageLanguageFromJson(json);
}
