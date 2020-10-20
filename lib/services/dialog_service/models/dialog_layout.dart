import 'package:flutter/material.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class DialogLayout extends StatefulWidget {
  final Widget child;
  final Color background;
  final EdgeInsets margin;

  DialogLayout({
    this.child,
    this.margin,
    this.background,
  }) : super(key: Key('DialogLayout'));

  @override
  _DialogLayoutState createState() => _DialogLayoutState();
}

class _DialogLayoutState extends State<DialogLayout> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: MILLISECONDS_500);
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 16.0),
            padding: widget.margin ??const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: widget.background ?? CustomTheme.colors.background,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
