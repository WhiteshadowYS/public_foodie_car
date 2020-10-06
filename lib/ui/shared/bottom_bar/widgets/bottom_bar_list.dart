import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';

import '../bottom_bar_vm.dart';
import 'bottom_bar_item.dart';

class BottomBarList extends StatelessWidget {
  final BottomBarVM vm;
  final void Function(String, BottomBarVM) onTap;
  final double height;

  // ignore: use_key_in_widget_constructors
  BottomBarList({
    @required this.height,
    @required this.vm,
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
            ),
        ],
      ),
    );
  }
}
