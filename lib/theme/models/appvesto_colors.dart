import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/interfaces/i_appvesto_colors.dart';
import 'package:my_catalog/theme/models/colors_dto.dart';

class AVColors implements IAVColors {
  Color primaryColor;
  Color accentColor;
  Color errorColor;

  Color font;
  Color minorFont;
  Color accentFont;
  Color buttonFont;
  Color background;
  Color footerIcons;
  Color footerIconsSelected;
  Color footerBackground;
  Color buttons;
  Color popupBackground;
  Color popupText;
  Color popupCloseButton;
  Color popupOkButton;
  Color popupCancelButton;

  Brightness brightness;

  AVColors({
    this.primaryColor,
    this.accentColor,
    this.errorColor,

    this.font,
    this.minorFont,
    this.accentFont,
    this.buttonFont,
    this.background,
    this.footerIcons,
    this.footerIconsSelected,
    this.footerBackground,
    this.buttons,
    this.popupBackground,
    this.popupText,
    this.popupCloseButton,
    this.popupOkButton,
    this.popupCancelButton,

    this.brightness,
  });

  AVColors fromColorsDTO(ColorsDTO colorsDTO) {
    final AVColors _c = copyWith(
      primaryColor: _hexStringToColor(colorsDTO.primaryColor),
      accentColor: _hexStringToColor(colorsDTO.accentColor),
      errorColor: _hexStringToColor(colorsDTO.errorColor),

      font: _hexStringToColor(colorsDTO.font),
      minorFont: _hexStringToColor(colorsDTO.minorFont),
      accentFont: _hexStringToColor(colorsDTO.accentFont),
      background: _hexStringToColor(colorsDTO.background),
      footerIcons: _hexStringToColor(colorsDTO.footerIcons),
      footerIconsSelected: _hexStringToColor(colorsDTO.footerIconsSelected),
      footerBackground: _hexStringToColor(colorsDTO.footerBackground),
      buttonFont: _hexStringToColor(colorsDTO.buttonFont),

      buttons: _hexStringToColor(colorsDTO.buttons),
      popupBackground: _hexStringToColor(colorsDTO.popupBackground),
      popupText: _hexStringToColor(colorsDTO.popupText),
      popupCloseButton: _hexStringToColor(colorsDTO.popupCloseButton),
      popupOkButton: _hexStringToColor(colorsDTO.popupOkButton),
      popupCancelButton: _hexStringToColor(colorsDTO.popupCancelButton),

      brightness: _getBrightness(colorsDTO.brightness),
    );

    return _c;
  }

  AVColors copyWith({
    Color primaryColor,
    Color accentColor,
    Color errorColor,
    Color font,
    Color minorFont,
    Color accentFont,
    Color background,
    Color footerIcons,
    Color footerIconsSelected,
    Color footerBackground,
    Color buttonFont,
    Color buttons,
    Color popupBackground,
    Color popupText,
    Color popupCloseButton,
    Color popupOkButton,
    Color popupCancelButton,
    Brightness brightness,
  }) {
    return AVColors(
      primaryColor: primaryColor ?? this.primaryColor,
      accentColor: accentColor ?? this.accentColor,
      errorColor: errorColor ?? this.errorColor,

      font: font ?? this.font,
      minorFont: minorFont ?? this.minorFont,
      accentFont: accentFont ?? this.accentFont,
      background: background ?? this.background,
      footerIcons: footerIcons ?? this.footerIcons,
      footerIconsSelected: footerIconsSelected ?? this.footerIconsSelected,
      footerBackground: footerBackground ?? this.footerBackground,
      buttonFont: buttonFont ?? this.buttonFont,
      buttons: buttons ?? this.buttons,
      popupBackground: popupBackground ?? this.popupBackground,
      popupText: popupText ?? this.popupText,
      popupCloseButton: popupCloseButton ?? this.popupCloseButton,
      popupOkButton: popupOkButton ?? this.popupOkButton,
      popupCancelButton: popupCancelButton ?? this.popupCancelButton,

      brightness: brightness ?? this.brightness,
    );
  }

  Brightness _getBrightness(String brightness) {
    if (Platform.isIOS) {
      if (brightness == 'DARK') return Brightness.light;

      return Brightness.dark;
    } else {
    if (brightness == 'DARK') return Brightness.dark;

    return Brightness.light;
    }
  }

  Color _hexStringToColor(String hex) {

    if (hex == null) return null;

    try {
      return Color(int.parse('FF$hex', radix: 16));
    } catch (e) {
      logger.e('_hexStringToColor: $e');
      return null;
    }
  }
}