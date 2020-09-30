import 'package:flutter/material.dart';

import 'package:my_catalog/res/typedef.dart';
import 'package:my_catalog/res/app_styles/app_shadows.dart';

import 'package:my_catalog/theme/custom_theme.dart';

class BottomBarItemContainer extends StatelessWidget {
  final double size;
  final Widget child;
  final bool isSelected;
  final OnTapFunction onTap;

  const BottomBarItemContainer({
    @required this.size,
    @required this.child,
    this.onTap,
    Key key,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: isSelected
              ? CustomTheme.colors.accentColor
              : CustomTheme.colors.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: isSelected ? AppShadows.bottomBarItemShadow : [],
        ),
        child: child,
      ),
    );
  }
}
