import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_catalog/res/const.dart';

class FadeAnimationContainer extends StatefulWidget {
  final Widget placeholder;
  final EdgeInsets margin;
  final double borderRadius;
  final int periodicSeconds;

  FadeAnimationContainer(
      {@required String key,
      @required this.placeholder,
      this.periodicSeconds = 10,
      this.borderRadius = 20.0,
      this.margin = const EdgeInsets.all(0.0)})
      : super(key: Key(key));

  @override
  _FadeAnimationContainerState createState() => _FadeAnimationContainerState();
}

class _FadeAnimationContainerState extends State<FadeAnimationContainer> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animation = Tween<double>(begin: 0.0, end: pi*2).animate(_animationController);
    _animationController.repeat(period: Duration(seconds: 1));
    _animationController.addListener(loading);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(loading);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: _animation.value,
          child: widget.placeholder,
        ),
      ],
    );
  }

  void loading() => setState(() {});
}
