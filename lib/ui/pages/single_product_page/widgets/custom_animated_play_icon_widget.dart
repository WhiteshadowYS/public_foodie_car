import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_catalog/ui/shared/canvas/custom_play_icon_paint.dart';
import 'package:video_player/video_player.dart';

class CustomAnimatedPlayIconWidget extends StatefulWidget {
  final Duration duration;
  final Color color;
  final Color strokeColor;
  final double size;
  final VideoPlayerController controller;

  CustomAnimatedPlayIconWidget({
    @required this.duration,
    this.size = 25.0,
    this.color,
    this.strokeColor,
    this.controller,
  })  : assert(duration != null),
        super(key: Key('CustomAnimatedPlayIconWidget'));

  @override
  _CustomAnimatedIconWidgetState createState() => _CustomAnimatedIconWidgetState();
}

class _CustomAnimatedIconWidgetState extends State<CustomAnimatedPlayIconWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController animationTwoController;
  bool realtimeMove = false;
  Tween tween;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(duration: widget.duration, vsync: this, value: 1.0);
    animationTwoController = AnimationController(duration: widget.duration, vsync: this, value: 1.0);
    animationController.addListener(_firstControllerUpdateListener);
    animationTwoController.addListener(_secondControllerUpdateListener);
    super.initState();
  }

  @override
  void dispose() {
    animationController.removeListener(_firstControllerUpdateListener);
    animationTwoController.removeListener(_secondControllerUpdateListener);
    animationController.dispose();
    animationTwoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.value.isPlaying) {
      animationController.reverse();
      animationTwoController.reverse();
    } else {
      animationController.forward();
    }
    return Center(
      child: Transform.rotate(
        angle: -(pi / (2 / (1 - animationController.value))),
        child: Container(
          width: widget.size,
          height: widget.size,
          child: CustomPaint(
            foregroundPainter: CustomPlayIconPaint(
              color: widget.color,
              strokeColor: widget.strokeColor,
              sizeIcon: widget.size,
              value: animationTwoController.value,
            ),
          ),
        ),
      ),
    );
  }

  void _firstControllerUpdateListener() {
    if (animationController.value == 1) {
      if (animationTwoController.value != 1) {
        animationTwoController.forward();
      }
    } else {
      animationTwoController.reverse();
    }
    setState(() {});
  }

  void _secondControllerUpdateListener() => setState(() {});
}
