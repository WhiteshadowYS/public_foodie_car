import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_language.g.dart';
part 'global_language.freezed.dart';

@freezed
abstract class GlobalLanguage with _$GlobalLanguage {
  @JsonSerializable()
  const factory GlobalLanguage({
    @required String noNameText,
    @required String buyButtonText,
    @required String buttonOkText,
    @required String buttonErrorText,
    @required String errorTitle,
    @required String descriptionTitle,
    @required String languageTitle,
    @required String cityTitle,
    @required String currecyTitle,
    @required String currencyValue,
    @required String weightTitle,
    @required String weightValue,
  }) = _GlobalLanguage;

  factory GlobalLanguage.fromJson(Map json) => _$GlobalLanguageFromJson(json);
}
