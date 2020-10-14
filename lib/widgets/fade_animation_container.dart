import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class FadeAnimationContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsets margin;
  final double borderRadius;
  final int periodicSeconds;

  FadeAnimationContainer({
    @required String key,
    @required this.child,
    this.periodicSeconds = 10,
    this.borderRadius = 20.0,
    this.margin = const EdgeInsets.all(0.0)
  }) : super(key: Key(key));

  @override
  _FadeAnimationContainerState createState() => _FadeAnimationContainerState();
}

class _FadeAnimationContainerState extends State<FadeAnimationContainer> {
  Timer timer;
  double opacity = 0.0;

  @override
  void initState() {
    timer = Timer.periodic(
      Duration(seconds: widget.periodicSeconds),
      (_) async {
        setState(() => opacity = 0.2);
        await Future.delayed(Duration(seconds: 1));
        setState(() => opacity = 0.0);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: CustomTheme.colors.primaryColor.withOpacity(opacity),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: widget.child,
    );
  }
}
