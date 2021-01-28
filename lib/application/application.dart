import 'package:foodie_car_template/application/application_vm.dart';
import 'package:foodie_car_template/data/res/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_car_template/data/res/keys.dart';
import 'package:foodie_car_template/data/res/locales.dart';
import 'package:foodie_car_template/data/theme/custom_theme.dart';
import 'package:foodie_car_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_car_template/domain/functional_services/route_service/route_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:foodie_car_template/dictionary/flutter_delegate.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/shared/initialization/initialize_selector.dart';
import 'package:foodie_car_template/ui/widgets/splash_screen.dart';
import 'package:redux/redux.dart';

/// The [Application] class, in which the creation of [MaterialApp] takes place.
/// It takes [store] as a parameter, which is initialized in [main].
/// As [key], we set the string, "Application", which is inside [ApplicationKeys].
class Application extends StatelessWidget {
  final Store<AppState> store;

  Application({@required this.store}) : super(key: Key(ApplicationKeys.application));

  /// Here he connects to [StoreProvider], so that the application has one [store].
  /// In the [navigatorKey] option, we will write [NavigatorHolder] to NavigateToAction.
  /// Also, all rootes are connected here, in [onGenerateRoute].
  /// Also here is installed, the standard [locale], which can change in the course of the application.
  /// In [supportedLocales], we specify which languages will be used by the application.
  /// In [localizationsDelegates], we connect delegates.
  /// In the [builder] function, we specify the [textScaleFactor] that will be used throughout the application.
  /// After initialization, we will move to [SplashScreen].
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      allowFontScaling: DESIGN_SCREEN_ALLOW_FONT_SCALING,
      designSize: Size(
        DESIGN_SCREEN_WIDTH,
        DESIGN_SCREEN_HEIGHT,
      ),
      child: StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, ApplicationVM>(
          converter: ApplicationVM.init,
          onInitialBuild: (ApplicationVM vm) => InitializeSelectors.startInitialization(store),
          builder: (BuildContext context, ApplicationVM vm) {
            print('locale');
            return MaterialApp(
              theme: ThemeData(
                splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
                highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
              ),
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigatorHolder.navigatorKey,
              onGenerateRoute: RouteBuilder.onGenerateRoute,
              home: SplashScreen(),
              locale: Locale(vm.locale),
              supportedLocales: FlutterDictionaryDelegate.getSupportedLocales,
              localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ),
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
