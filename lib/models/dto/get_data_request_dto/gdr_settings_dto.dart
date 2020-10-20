import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_colors_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_footer_button_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_info_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_language_data_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/gdr_language_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gdr_settings_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GDRSettingsDto implements IDto {

  @JsonKey(name: 'languages', required: false, nullable: true)
  final List<GDRLanguageDto> languages;
  @JsonKey(name: 'language_data', required: false, nullable: true)
  final GDRLanguageDataDto languageData;
  @JsonKey(name: 'tac', required: false, nullable: true)
  final String tac;
  @JsonKey(name: 'info', required: false, nullable: true)
  final GDRInfoDto info;
  @JsonKey(name: 'font', required: false, nullable: true)
  final String font;
  @JsonKey(name: 'color_hex', required: false, nullable: true)
  final GDRColorsDto colors;
  @JsonKey(name: 'footer_buttons', required: false, nullable: true)
  final List<GDRFooterButtonDto> footerButtons;

  const GDRSettingsDto({
    @required this.languages,
    @required this.tac,
    @required this.info,
    @required this.font,
    @required this.colors,
    @required this.languageData,
    @required this.footerButtons,
  });

  factory GDRSettingsDto.fromJson(json) => _$GDRSettingsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GDRSettingsDtoToJson(this);
}
