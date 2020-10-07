import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar_vm.dart';

import 'bottom_bar_item.dart';

class BottomBarList extends StatelessWidget {
  final BottomBarVM vm;
  final void Function(String, BottomBarVM) onTap;
  final bool isSwitch;
  final double height;

  BottomBarList({
    @required this.height,
    @required this.vm,
    @required this.isSwitch,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kWhite),
        color: AppColors.kWhite,
      ),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var item in vm.footerButtons)
            BottomBarItem(
              iconUrl: item.iconSvg,
              onTap: () => onTap(item.type, vm),
              isSelected: _isButtonSelected(item.type),
            ),
        ],
      ),
    );
  }

  bool _isButtonSelected(String buttonType) {
    if(buttonType!=PageTypes.SWITCH_TYPE && isSwitch){
      return false;
    }
    switch (buttonType) {
      case PageTypes.HOME_TYPE:
        return RouteService.instance.currentRoute == Routes.catalogs;
      case PageTypes.SETTINGS_TYPE:
        return RouteService.instance.currentRoute == Routes.settings;
      case PageTypes.LOGOUT_TYPE:
        return RouteService.instance.currentRoute == Routes.main;
      case PageTypes.SWITCH_TYPE:
        return isSwitch;
      default: return false;
    }
  }
}
