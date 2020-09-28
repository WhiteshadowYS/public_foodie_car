import 'package:flutter/material.dart';

import 'package:pictures_view/theme/custom_theme.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final double height;
  final String title;

  MainAppBar({
    @required this.title,
    this.height = 91.0,
  })  : preferredSize = Size.fromHeight(height),
        assert(title != null, throw ('You forgot filled title!')),
        super(key: const Key('MainAppBar'));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.colors.accentColor,
      child: SafeArea(
        top: true,
        child: Container(
          height: height,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 17.0),
          child: Text(
            title,
            style: CustomTheme.textStyles.titleTextStyle(
              size: 20.0,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
