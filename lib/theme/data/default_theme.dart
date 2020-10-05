import 'package:flutter/material.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';

import 'package:my_catalog/theme/models/appvesto_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:my_catalog/theme/models/appvesto_edge_insets.dart';
import 'package:my_catalog/theme/models/appvesto_text_styles.dart';

AVTheme darkTheme = AVTheme(
  themeName: 'default_theme',
  colors: AVColors(
    primaryColor: AppColors.kBlack,
    accentColor: AppColors.kBlackLight,
    activeColor: AppColors.kOrange,
    inActiveColor: AppColors.kGreyTwo,
  ),
  textStyles: AVTextStyles(
    titleFontFamily: 'Ubuntu',
    textFontFamily: 'SF Pro Display',
    mainTextColor: AppColors.kWhite,
  ),
  edgeInsets: AVEdgeInsets(
    primaryEdgeInsets: EdgeInsets.all(16.0),
  ),
);

AVTheme lightTheme = AVTheme(
  themeName: 'default_theme',
  colors: AVColors(
    primaryColor: AppColors.kWhite,
    accentColor: AppColors.kWhiteDark,
    activeColor: AppColors.kOrange,
    inActiveColor: AppColors.kGreyTwo,
  ),
  textStyles: AVTextStyles(
    titleFontFamily: 'Ubuntu',
    textFontFamily: 'SF Pro Display',
    mainTextColor: AppColors.kBlack,
  ),
  edgeInsets: AVEdgeInsets(
    primaryEdgeInsets: EdgeInsets.all(16.0),
  ),
);
