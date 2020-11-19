import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:base_project_template/res/const.dart';
import 'package:base_project_template/theme/custom_theme.dart';
import 'package:base_project_template/utils/launch_browser.dart';

class LinksButton extends StatefulWidget {
  final String keyValue;
  final String title;
  final String url;

  LinksButton({
    @required this.keyValue,
    @required this.title,
    @required this.url,
  }) : super(key: Key(keyValue + 'LinksButton'));

  @override
  _LinksButtonState createState() => _LinksButtonState();
}

class _LinksButtonState extends State<LinksButton> {
  bool _tap = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        key: Key(widget.keyValue),
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedDefaultTextStyle(
          duration: MILLISECONDS_300,
          style: CustomTheme.textStyles.linkTextStyle(
            size: 18.0.sp,
            decorationThickness: 0.6,
            fontWeight: FontWeight.bold,
            decorationColor: _tap
                ? CustomTheme.colors.accentFont.withOpacity(0.0)
                : CustomTheme.colors.accentFont,
          ),
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _tap = true;
    setState(() {});
  }

  void _onTapUp(TapUpDetails details) {
    _tap = false;
    launchBrowser(widget.url);
    setState(() {});
  }

  void _onTapCancel() {
    _tap = false;
    setState(() {});
  }
}