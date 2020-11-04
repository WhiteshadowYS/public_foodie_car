import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/interfaces/i_dto.dart';
import 'package:my_catalog/theme/custom_theme.dart';

part 'colors_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class ColorsModel implements IDto {
  @JsonKey(name: 'primary_color', required: false, nullable: true)
  final String primaryColor;
  @JsonKey(name: 'accent_color', required: false, nullable: true)
  final String accentColor;
  @JsonKey(name: 'error_color', required: false, nullable: true)
  final String errorColor;
  @JsonKey(name: 'font', required: false, nullable: true)
  final String font;
  @JsonKey(name: 'minor_font', required: false, nullable: true)
  final String minorFont;
  @JsonKey(name: 'background', required: false, nullable: true)
  final String background;
  @JsonKey(name: 'footer_icons', required: false, nullable: true)
  final String footerIcons;
  @JsonKey(name: 'footer_icons_selected', required: false, nullable: true)
  final String footerIconsSelected;
  @JsonKey(name: 'footer_background', required: false, nullable: true)
  final String footerBackground;
  @JsonKey(name: 'button_font', required: false, nullable: true)
  final String buttonFont;
  @JsonKey(name: 'accent_font', required: false, nullable: true)
  final String accentFont;
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
  @JsonKey(name: 'brightness', required: false, nullable: true)
  final String brightness;

  ColorsModel({
    @required this.background,
    @required this.accentColor,
    @required this.accentFont,
    @required this.buttonFont,
    @required this.buttons,
    @required this.errorColor,
    @required this.font,
    @required this.footerBackground,
    @required this.popupText,
    @required this.footerIcons,
    @required this.footerIconsSelected,
    @required this.minorFont,
    @required this.popupBackground,
    @required this.popupCancelButton,
    @required this.popupCloseButton,
    @required this.popupOkButton,
    @required this.primaryColor,
    @required this.brightness,
  });

  factory ColorsModel.fromJson(json) => _$ColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsModelToJson(this);
}
