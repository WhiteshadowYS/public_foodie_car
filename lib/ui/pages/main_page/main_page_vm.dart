import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() navigateToTermsPage;
  final void Function() getData;
  final void Function() changeTheme;
  final CustomTheme theme;
  final AVColors colors;

  const MainPageVM({
    @required this.navigateToTermsPage,
    @required this.getData,
    @required this.changeTheme,
    @required this.theme,
    @required this.colors,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
      getData: StorageSelector.getDataFunction(store),
      changeTheme: () => CustomTheme.instance.setColorsFromJson({
        "buttons": "E74C3C",
        "accent_font": "E74C3C",
        "background": "5DB075",
        "font": "FFFFFF",
      }),
      theme: CustomTheme.instance,
      colors: CustomTheme.colors,
    );
  }
}