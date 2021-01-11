import 'package:foodie_client_template/data/res/app_styles/default_app_colors.dart';
import 'package:foodie_client_template/data/theme/models/app_colors.dart';
import 'package:foodie_client_template/data/theme/models/app_text_styles.dart';
import 'package:foodie_client_template/data/theme/models/app_theme.dart';

AppTheme defaultTheme = AppTheme(
  themeName: 'default_theme',
  colors: AppColors(
    primaryColor: DefaultAppColors.orange,
    accentColor: DefaultAppColors.blue,
    errorColor: DefaultAppColors.red,
    font: DefaultAppColors.grey,
    minorFont: DefaultAppColors.lightGrey,
    accentFont: DefaultAppColors.orange,
    background: DefaultAppColors.white,
    footerIcons: DefaultAppColors.orange,
    footerIconsSelected: DefaultAppColors.orange,
    footerBackground: DefaultAppColors.white,
    buttonFont: DefaultAppColors.white,
    buttons: DefaultAppColors.orange,
    popupBackground: DefaultAppColors.white,
    popupText: DefaultAppColors.grey,
    popupCloseButton: DefaultAppColors.orange,
    popupOkButton: DefaultAppColors.orange,
    popupCancelButton: DefaultAppColors.orange,
  ),
  textStyles: AppTextStyles(
    fontFamily: 'Ubuntu',
    mainTextColor: DefaultAppColors.black.withOpacity(0.6),
    titleTextColor: DefaultAppColors.white,
    additionalTextColor: DefaultAppColors.white,
    accentTextColor: DefaultAppColors.orange,
  ),
);
