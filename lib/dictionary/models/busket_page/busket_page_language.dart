import 'package:freezed_annotation/freezed_annotation.dart';

part 'busket_page_language.g.dart';
part 'busket_page_language.freezed.dart';

@freezed
abstract class BusketPageLanguage with _$BusketPageLanguage {
  @JsonSerializable()
  const factory BusketPageLanguage({
    @required String title,
  }) = _BusketPageLanguage;

  factory BusketPageLanguage.fromJson(Map json) => _$BusketPageLanguageFromJson(json);
}
