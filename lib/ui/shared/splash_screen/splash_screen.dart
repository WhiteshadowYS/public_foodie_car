import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_version/get_version.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/splash_screen/widgets/splash_loader.dart';


/// [SplashScreen] is the very first page you need to download the application.
/// It is necessary to initialize the flutter_screenutil package.
/// Also in the [updateAppVersion] function, all information about the current version of the application is displayed in the console.
// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// This variable will write all information about the application.
  String appVersion;

  @override
  void initState() {
    // TODO(Andrey): We had to call this function here because during initialization, FlutterDictionary, language==null. Is it correct and can it be done differently?
    FlutterDictionary.instance.setNewLanguage(FlutterDictionaryDelegate.getCurrentLocale);
    /// This function will be called after the first build
    /// It is necessary to initialize the flutter_screenutil package.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScreenUtil.init(
        context,
        height: DESIGN_SCREEN_HEIGHT,
        width: DESIGN_SCREEN_WIDTH,
        allowFontScaling: DESIGN_SCREEN_ALLOW_FONT_SCALING,
      );
    });
    /// This function displays the current version of the application in the console.
    _updateAppVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.colors.accentColor,
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              TITLE,
              style: CustomTheme.textStyles.titleTextStyle(size: 30),
            ),
            SizedBox(height: 20.0),
            SvgPicture.asset(ImageAssets.LOGO),
            SizedBox(height: 40.0),
            /// Here the download widget is called, he should specify [duration] as a parameter.
            /// Also to adapt to different screens, in the parameter [padding], apply MediaQuery,
            /// which makes indents of 25% of the width of the screen.
            SplashLoader(
              duration: Duration(seconds: 4),
              color: AppColors.kGreen,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
              backColor: AppColors.kGreyTwo.withOpacity(0.5),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
  /// This function displays the current version of the application in the console.
  ///The [versionName] option will return the current weight of the application.
  ///The [versionCode] option will return the current application version code.
  ///The [versionPlatform] parameter will return the current platform.
  Future<void> _updateAppVersion() async {
    String versionName;
    String versionCode;
    String versionPlatform;

    try {
      versionName = await GetVersion.projectVersion;
      logger.d('Version Name: $versionName');
    } on PlatformException {
      logger.e('Failed to get project version.');
      versionName = null;
    }

    try {
      versionCode = await GetVersion.projectCode;
      logger.d('Version Code: $versionCode');
    } on PlatformException {
      logger.e('Failed to get code version.');
      versionCode = null;
    }

    try {
      versionPlatform = await GetVersion.platformVersion;
      logger.d('Version Platform: $versionPlatform');
    } on PlatformException {
      logger.e('Failed to get platform version.');
      versionPlatform = null;
    }

    setState(() {
      appVersion = '$versionPlatform \n $versionName + $versionCode';
    });
  }
}
