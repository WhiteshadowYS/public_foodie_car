import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/get_data_request_colors_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/get_data_request_info_dto.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/settings/get_data_request_language_dto.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_data_request_settings_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class GetDataRequestSettingsDto implements IDto {
  @JsonKey(name: 'languages', required: false, nullable: true)
  final List<GetDataRequestLanguageDto> languages;
  @JsonKey(name: 'tac', required: false, nullable: true)
  final String tac;
  @JsonKey(name: 'info', required: false, nullable: true)
  final GetDataRequestInfoDto info;
  @JsonKey(name: 'font', required: false, nullable: true)
  final String font;
  @JsonKey(name: 'color_hex', required: false, nullable: true)
  final GetDataRequestColorsDto colors;
  @JsonKey(name: 'footer_buttons', required: false, nullable: true)
  final String footerButtons;

  const GetDataRequestSettingsDto({
    @required this.languages,
    @required this.tac,
    @required this.info,
    @required this.font,
    @required this.colors,
    @required this.footerButtons,
  });

  factory GetDataRequestSettingsDto.fromJson(json) => _$GetDataRequestSettingsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDataRequestSettingsDtoToJson(this);
}
