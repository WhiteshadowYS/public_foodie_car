import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/res/const.dart';
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomBarSwitch(isSwitch: isSwitch, vm: vm, onTap: _onTap),
            BottomBarList(onTap: _onTap, height: widget.height, vm: vm, isSwitch: isSwitch),
          ],
        );
      },
    );
  }

  void _onTap(String type, BottomBarVM vm) {
    switch (type) {
      case PageTypes.HOME_TYPE:
        vm.navigateCatalogPage();
        break;
      case PageTypes.SETTINGS_TYPE:
        vm.navigateToSettingsPage();
        break;
      case PageTypes.LOGOUT_TYPE:
        vm.navigateToMainPage();
        vm.removeOpenedStore();
        break;
      case PageTypes.SWITCH_TYPE:
        setState(() {
          isSwitch = !isSwitch;
        });
        break;
    }
  }
}
