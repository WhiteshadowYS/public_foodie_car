import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'colors_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class ColorsModel implements IDto {
  @JsonKey(name: 'font', required: false, nullable: true)
  final String font;

  @JsonKey(name: 'background', required: false, nullable: true)
  final String background;

  @JsonKey(name: 'footer_icons', required: false, nullable: true)
  final String footerIcons;

  @JsonKey(name: 'footer_icons_selected', required: false, nullable: true)
  final String footerIconsSelected;

  @JsonKey(name: 'footer_background', required: false, nullable: true)
  final String footerBackground;

  @JsonKey(name: 'footer_font', required: false, nullable: true)
  final String footerFont;

  @JsonKey(name: 'buttons', required: false, nullable: true)
  final String buttons;

  @JsonKey(name: 'popup_background', required: false, nullable: true)
  final String popupBackground;

  @JsonKey(name: 'popup_text', required: false, nullable: true)
  final String popupText;

  @JsonKey(name: 'popup_close_button', required: false, nullable: true)
  final String popupCloseButton;

  @JsonKey(name: 'popup_ok_button', required: false, nullable: true)
  final String popupOkButton;

  @JsonKey(name: 'popup_cancel_button', required: false, nullable: true)
  final String popupCancelButton;

  const ColorsModel({
    @required this.font,
    @required this.background,
    @required this.buttons,
    @required this.footerBackground,
    @required this.footerFont,
    @required this.footerIcons,
    @required this.footerIconsSelected,
    @required this.popupBackground,
    @required this.popupCancelButton,
    @required this.popupCloseButton,
    @required this.popupOkButton,
    @required this.popupText,
  });

  factory ColorsModel.fromJson(json) => _$ColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsModelToJson(this);
}
