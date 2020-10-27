import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/colors_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_data_model.dart';

part 'settings_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
/// The class [SettingsModel] is a model that stores data about the [SettingsModel].
/// The purpose of the [SettingsModel] class is to accept all the customization of the theme and application settings from the server.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [SettingsModel], implements from the abstract class [IDto].
/// The [SettingsModel] class has 7 variables,
/// [languages], [languageData], [tac], [info], [font], [colors], [footerButtons].
/// Variable [languages], stores information about the languages in which the application is calculated.
/// In the variable [language_data], store different system texts, in different languages.
/// [tac], stores the stock in which the user agreement is written.
/// In the [info] variable, the information about the company is written.
/// [font] stores information about the font in the application
/// In [color_hex], store the color scheme of the application.
/// Inside [footer_buttons], there are buttons that will be used in [BottomBar].
class SettingsModel implements IDto {
  @JsonKey(name: 'languages', required: false, nullable: true)
  final List<LanguageModel> languages;
  @JsonKey(name: 'language_data', required: false, nullable: true)
  final LanguageDataModel languageData;
  @JsonKey(name: 'tac', required: false, nullable: true)
  final String tac;
  @JsonKey(name: 'tac2', required: false, nullable: true)
  final String tac2;
  @JsonKey(name: 'info', required: false, nullable: true)
  final InfoModel info;
  @JsonKey(name: 'font', required: false, nullable: true)
  final String font;
  @JsonKey(name: 'color_hex', required: false, nullable: true)
  final ColorsModel colors;
  @JsonKey(name: 'footer_buttons', required: false, nullable: true)
  final List<FooterButtonModel> footerButtons;

  const SettingsModel({
    @required this.languages,
    @required this.tac,
    @required this.tac2,
    @required this.info,
    @required this.font,
    @required this.colors,
    @required this.languageData,
    @required this.footerButtons,
  });

  /// Also the class [SettingsModel], has [fromJson] and [toJson] to work with the json format.
  /// [SettingsModel], creates a new exemplar [SettingsModel], based on json.
  factory SettingsModel.fromJson(json) => _$SettingsModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [SettingsModel].
  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);
}
