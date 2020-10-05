import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class BottomBarVM {
  final List<FooterButtonModel> footerButtons;
  final void Function() navigateCategoriesPage;
  final void Function() navigateToSettingsPage;
  final void Function() navigateToMainPage;

  BottomBarVM({
    @required this.footerButtons,
    @required this.navigateCategoriesPage,
    @required this.navigateToMainPage,
    @required this.navigateToSettingsPage,
  });

  static BottomBarVM fromStore(Store<AppState> store) {
    return BottomBarVM(
      // TODO(Daniil): Use selector for this
      footerButtons: dummyButtons,
      navigateCategoriesPage: RouteSelectors.gotoCategoriesPage(store),
      navigateToMainPage: RouteSelectors.gotoMainPage(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
    );
  }

  static List<FooterButtonModel> dummyButtons = [
    FooterButtonModel(
      type: 'HOME',
      iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/15/15730.svg',
      name: {'EN': 'Home'},
      list: [],
    ),
    FooterButtonModel(
      type: 'SETTINGS',
      iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/2099/2099058.svg',
      name: {'EN': 'Settings'},
      list: [],
    ),
    FooterButtonModel(
      type: 'SWITCH',
      iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/565/565619.svg',
      name: {'EN': 'Switch'},
      list: [
        FooterButtonModel(
          type: 'SETTINGS',
          iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/2099/2099058.svg',
          name: {'EN': 'Settings'},
          list: [],
        ),
        FooterButtonModel(
          type: 'LOGOUT',
          iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/1286/1286853.svg',
          name: {'EN': 'Logout'},
          list: [],
        ),
      ],
    ),
    FooterButtonModel(
      type: 'LOGOUT',
      iconSvg: 'https://www.flaticon.com/svg/static/icons/svg/1286/1286853.svg',
      name: {'EN': 'Logout'},
      list: [],
    ),
  ];
}
