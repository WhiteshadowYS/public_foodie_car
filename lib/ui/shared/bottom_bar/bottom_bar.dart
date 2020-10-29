import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar_vm.dart';

import 'widgets/bottom_bar_list.dart';
import 'widgets/bottom_bar_switch.dart';

class BottomBar extends StatefulWidget {
  final double height;

  BottomBar({
    @required String key,
    this.height = 100.0,
  }) : super(key: Key(key));

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomBarVM>(
      converter: BottomBarVM.fromStore,
      builder: (BuildContext context, vm) {
        double width = vm.footerButtons.length * 80.0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomBarSwitch(
              close: _closeSwitchSheet,
              keyValue: BottomBarKeys.bottomBarSwitch,
              isSwitch: isSwitch,
              vm: vm,
              onTap: _onTap,
              getPlaceholder: _placeholderIcon,
            ),
            BottomBarList(
              keyValue: BottomBarKeys.bottomBarList,
              onTap: _onTap,
              height: (widget.height).h,
              vm: vm,
              isSwitch: isSwitch,
              getPlaceholder: _placeholderIcon,
            ),
          ],
        );
      },
    );
  }

  void _closeSwitchSheet() {
    setState(() {
      isSwitch = false;
    });
  }

  // TODO(Daniil): Fix it
  String _placeholderIcon(String type) {
    switch (type) {
      case PageTypes.HOME_TYPE:
        return ImageAssets.HOME_ICON;
      case PageTypes.SETTINGS_TYPE:
        return ImageAssets.SETTINGS_ICON;
      case PageTypes.SIGNOUT_TYPE:
        return ImageAssets.LOGOUT_ICON;
      case PageTypes.ANOTHER_CATALOG:
        return ImageAssets.ANOTHER_CATALOG_ICON;
      case PageTypes.SWITCH_TYPE:
        return ImageAssets.SWITCH_ICON;
    }
  }

  void _onTap(String type, BottomBarVM vm) {
    switch (type) {
      case PageTypes.HOME_TYPE:
        vm.navigateCategoryPage(vm.currentIndex);
        break;
      case PageTypes.SETTINGS_TYPE:
        vm.navigateToSettingsPage();
        break;
      case PageTypes.SIGNOUT_TYPE:
        vm.navigateToMainPage();
        vm.removeOpenedStore();
        break;
      case PageTypes.ANOTHER_CATALOG:
        vm.navigateToCatalogsPage();
        break;
      case PageTypes.SWITCH_TYPE:
        setState(() {
          isSwitch = !isSwitch;
        });
        break;
    }
  }
}
