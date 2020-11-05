import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_catalog/res/const.dart';

import 'package:my_catalog/theme/data/default_theme.dart';

import 'package:my_catalog/theme/models/appvesto_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:my_catalog/theme/models/appvesto_text_styles.dart';
import 'package:my_catalog/theme/models/colors_dto.dart';
import 'package:my_catalog/utils/check_is_hex_dark.dart';

class CustomTheme {
  static const String tag = '[CustomTheme]';

  CustomTheme._privateConstructor() {
    _theme = defaultTheme;
  }

  static final CustomTheme _instance = CustomTheme._privateConstructor();

  static CustomTheme get instance => _instance;

  AVTheme _theme;

  void setNewTheme(AVTheme thm) {
    logger.d('$tag => setNewTheme() => theme => ${thm.themeName}');
    _theme = thm;
  }

  void setColorsFromJson(Map<String, dynamic> json) {
    logger.d('$tag => <setColorsFromJson()> => json => $json');
    final AVColors newColors = colors.fromColorsDTO(ColorsDTO.fromJson(json));

    _theme = _theme.copyWith(
      colors: newColors,
      textStyles: textStyles.copyWith(
        titleTextColor: newColors.font,
        mainTextColor: newColors.minorFont,
        accentTextColor: newColors.accentFont,
        additionalTextColor: newColors.buttonFont,
      ),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: _theme.colors.background,
      statusBarBrightness: _getBrightness(_theme.colors.background),
      statusBarIconBrightness: _getBrightness(_theme.colors.background),
    ));
  }

  void setFontFamily(String fontFamily) {
    logger.d('$tag => <setFontFamily()> => fontFamily => $fontFamily');
    _theme.copyWith(
      textStyles: textStyles.copyWith(fontFamily: fontFamily),
    );
  }

  void setDefaultTheme() {
    logger.d('$tag => <setDefaultTheme()>');
    _theme = defaultTheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: _theme.colors.background,
      statusBarBrightness: _getBrightness(_theme.colors.background),
      statusBarIconBrightness: _getBrightness(_theme.colors.background),
    ));
  }

  Brightness _getBrightness(Color backgroundHex) {
    String hex = backgroundHex.toString();
    hex = hex.replaceAll('Color(0x', '');
    hex = hex.replaceAll(')', '');

    final bool isBackgroundDark = checkIsHexDark(hex);

    if (isBackgroundDark) return Brightness.dark;

    return Brightness.light;
  }

  static AVColors get colors => instance._theme.colors;

  static AVTextStyles get textStyles => instance._theme.textStyles;
}
