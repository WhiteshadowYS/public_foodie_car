import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_page_language.g.dart';
part 'gallery_page_language.freezed.dart';

@freezed
abstract class GalleryPageLanguage with _$GalleryPageLanguage {
  @JsonSerializable()
  const factory GalleryPageLanguage({
    @required String title,
  }) = _GalleryPageLanguage;

  factory GalleryPageLanguage.fromJson(Map json) => _$GalleryPageLanguageFromJson(json);
}
