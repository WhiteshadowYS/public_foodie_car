import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class MainButton extends StatefulWidget {
  final String title;
  final void Function() onTap;

   MainButton({
    @required String key,
    @required this.title,
    @required this.onTap,
  }) : super(key: Key(key));

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool _tap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        width: double.infinity,
        duration: MILLISECONDS_300,
        decoration: BoxDecoration(
          color: CustomTheme.colors.buttons.withOpacity(_tap ? 0.9 : 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: CustomTheme.textStyles.buttonTextStyle(size: 16.0),
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
    widget.onTap();
    setState(() {});
  }

  void _onTapCancel() {
    _tap = false;
    setState(() {});
  }
}
