import 'package:flutter/material.dart';
import 'package:my_catalog/utils/launch_browser.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class LinksButton extends StatefulWidget {
  final String title;
  final String url;

  LinksButton({
    @required String key,
    @required this.title,
    @required this.url,
  }) : super(key: Key(key));

  @override
  _LinksButtonState createState() => _LinksButtonState();
}

class _LinksButtonState extends State<LinksButton> {
  bool _tap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedDefaultTextStyle(
        duration: MILLISECONDS_300,
        style: CustomTheme.textStyles.linkTextStyle(
          size: 18.0,
          fontWeight: FontWeight.bold,
          decorationColor: _tap
              ? CustomTheme.colors.accentFont.withOpacity(0.0)
              : CustomTheme.colors.accentFont,
        ),
        child: Text(
          widget.title,
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
