import 'package:my_catalog/res/app_styles/app_colors.dart';

import 'package:my_catalog/theme/models/appvesto_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:my_catalog/theme/models/appvesto_text_styles.dart';

AVTheme defaultTheme = AVTheme(
  themeName: 'default_theme',
  colors: AVColors(
    primaryColor: AppColors.kGreen,
    accentColor: AppColors.kLightGrey,
    errorColor: AppColors.kRed,

    font: AppColors.kGrey,
    minorFont: AppColors.kLightGrey,
    background: AppColors.kWhite,
    footerIcons: AppColors.kGreen,
    footerIconsSelected: AppColors.kGreen,
    footerBackground: AppColors.kWhite,
    buttonFont: AppColors.kWhite,
    buttons: AppColors.kGreen,
    popupBackground: AppColors.kWhite,
    popupText: AppColors.kGrey,
    popupCloseButton: AppColors.kGreen,
    popupOkButton: AppColors.kGreen,
    popupCancelButton: AppColors.kGreen,
  ),
  textStyles: AVTextStyles(
    fontFamily: 'Ubuntu',
    mainTextColor: AppColors.kDarkGrey.withOpacity(0.6),
    titleTextColor: AppColors.kGrey,
    additionalTextColor: AppColors.kWhite,
    accentTextColor: AppColors.kGreen,
  ),
);
