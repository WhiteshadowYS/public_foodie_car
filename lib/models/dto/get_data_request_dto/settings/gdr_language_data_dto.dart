import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_language_data_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRLanguageDataDto implements IDto {
  @JsonKey(name: 'error_text', required: false, nullable: true)
  final Map<String, dynamic> errorText;

  @JsonKey(name: 'accept_text', required: false, nullable: true)
  final Map<String, dynamic> acceptText;

  @JsonKey(name: 'share_text', required: false, nullable: true)
  final Map<String, dynamic> shareText;

  @JsonKey(name: 'description_text', required: false, nullable: true)
  final Map<String, dynamic> descriptionText;

  @JsonKey(name: 'logout_text', required: false, nullable: true)
  final Map<String, dynamic> logoutText;

  @JsonKey(name: 'back_button_text', required: false, nullable: true)
  final Map<String, dynamic> backButtonText;

  @JsonKey(name: 'terms_title', required: false, nullable: true)
  final Map<String, dynamic> termsTitle;

  @JsonKey(name: 'terms_button_text', required: false, nullable: true)
  final Map<String, dynamic> termsButtonText;

  @JsonKey(name: 'tac_subtitle', required: false, nullable: true)
  final Map<String, dynamic> termsSubTitle;

  @JsonKey(name: 'tac2_subtitle', required: false, nullable: true)
  final Map<String, dynamic> terms2SubTitle;

  @JsonKey(name: 'terms_accept_button', required: false, nullable: true)
  final Map<String, dynamic> termsAcceptButton;

  @JsonKey(name: 'products_title', required: false, nullable: true)
  final Map<String, dynamic> productsTitle;

  @JsonKey(name: 'categories_title', required: false, nullable: true)
  final Map<String, dynamic> categoriesTitle;

  @JsonKey(name: 'subcategories_title', required: false, nullable: true)
  final Map<String, dynamic> subcategoriesTitle;

  @JsonKey(name: 'settings_title', required: false, nullable: true)
  final Map<String, dynamic> settingsTitle;

  const GDRLanguageDataDto({
    @required this.errorText,
    @required this.acceptText,
    @required this.shareText,
    @required this.descriptionText,
    @required this.logoutText,
    @required this.backButtonText,
    @required this.termsTitle,
    @required this.termsButtonText,
    @required this.termsSubTitle,
    @required this.terms2SubTitle,
    @required this.termsAcceptButton,
    @required this.productsTitle,
    @required this.categoriesTitle,
    @required this.subcategoriesTitle,
    @required this.settingsTitle,
  });

  factory GDRLanguageDataDto.fromJson(json) => _$GDRLanguageDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRLanguageDataDtoToJson(this);
}