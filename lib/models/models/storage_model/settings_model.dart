import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_colors_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_footer_button_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_info_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_language_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/models/storage_model/settings/colors_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';

part 'settings_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class SettingsModel implements IDto {
  @JsonKey(name: 'languages', required: false, nullable: true)
  final List<LanguageModel> languages;
  @JsonKey(name: 'tac', required: false, nullable: true)
  final String tac;
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
    @required this.info,
    @required this.font,
    @required this.colors,
    @required this.footerButtons,
  });

  factory SettingsModel.fromJson(json) => _$SettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);
}
