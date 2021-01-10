import 'package:flutter/material.dart';
import 'package:foody_client_template/data/res/settings.dart';
import 'package:foody_client_template/data/theme/custom_theme.dart';

class AppBottomBaritem extends StatelessWidget {
  final double iconSize;
  final IconData icon;
  final String page;

  const AppBottomBaritem({
    @required Key key,
    @required this.icon,
    this.page,
    this.iconSize = AppSettings.bottomBarIconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize,
      width: iconSize * 2.5,
      child: Icon(
        icon,
        size: iconSize,
        color: CustomTheme.colors.buttonFont,
      ),
    );
  }
}
