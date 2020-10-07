import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';

import 'widgets/main_app_bar_child.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({
    @required String key,
    this.height = 44.0,
    this.title,
    this.logoUrl,
    this.backOnTap,
  })  : preferredSize = Size.fromHeight(height),
        super(key: Key(key));

  @override
  final Size preferredSize;
  final String title;
  final String logoUrl;
  final Function backOnTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        width: double.infinity,
        color: CustomTheme.colors.background,
        alignment: Alignment.center,
        child: MainAppBarChild(
          key: key.toString(),
          title: title,
          backOnTap: backOnTap,
          logoUrl: logoUrl,
        ),
      ),
    );
  }
}
