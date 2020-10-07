import 'package:flutter/painting.dart';
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
  });

  AVColors fromColorsDTO(ColorsDTO colorsDTO) {
    print(colorsDTO.buttons);

    AVColors _c = copyWith(
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
    );

    print(_c.buttons);

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
    );
  }

  Color _hexStringToColor(String hex) {

    if (hex == null) return null;

    print('_hexStringToColor1: $hex');
    try {
      print('_hexStringToColor2: ${Color(int.parse('FF$hex', radix: 16))}');
      return Color(int.parse('FF$hex', radix: 16));
    } catch (e) {
      print('_hexStringToColor3: $e');
      return null;
    }
  }
}