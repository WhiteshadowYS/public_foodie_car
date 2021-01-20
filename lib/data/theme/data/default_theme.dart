import 'package:foodie_client_template/data/res/app_styles/default_app_colors.dart';
import 'package:foodie_client_template/data/theme/models/app_colors.dart';
import 'package:foodie_client_template/data/theme/models/app_text_styles.dart';
import 'package:foodie_client_template/data/theme/models/app_theme.dart';

AppTheme defaultTheme = AppTheme(
  themeName: 'default_theme',
  colors: AppColors(
    primaryColor: DefaultAppColors.green,
    accentColor: DefaultAppColors.blue,
    errorColor: DefaultAppColors.red,
    font: DefaultAppColors.grey,
    minorFont: DefaultAppColors.lightGrey,
    accentFont: DefaultAppColors.green,
    background: DefaultAppColors.white,
    footerIcons: DefaultAppColors.green,
    footerIconsSelected: DefaultAppColors.green,
    footerBackground: DefaultAppColors.white,
    buttonFont: DefaultAppColors.white,
    buttons: DefaultAppColors.green,
    popupBackground: DefaultAppColors.white,
    popupText: DefaultAppColors.grey,
    popupCloseButton: DefaultAppColors.green,
    popupOkButton: DefaultAppColors.green,
    popupCancelButton: DefaultAppColors.green,
  ),
  textStyles: AppTextStyles(
    fontFamily: 'Ubuntu',
    mainTextColor: DefaultAppColors.black.withOpacity(0.6),
    titleTextColor: DefaultAppColors.white,
    additionalTextColor: DefaultAppColors.white,
    accentTextColor: DefaultAppColors.green,
  ),
);
