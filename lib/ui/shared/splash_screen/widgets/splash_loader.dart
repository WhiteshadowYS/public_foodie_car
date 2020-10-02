import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashLoader extends StatefulWidget {
  final LinearGradient gradient;
  final EdgeInsets padding;
  final double strokeWidth;
  final Duration duration;
  final double height;
  final double radius;
  final Color color;
  final Color backColor;

  // ignore: use_key_in_widget_constructors
  SplashLoader({
    @required this.duration,
    this.strokeWidth = 0.0,
    this.height = 2.0,
    this.radius = 11.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 70.0),
    this.color,
    this.backColor,
    this.gradient,
  }) : assert(duration != null && (gradient != null || color != null));

  @override
  _SplashLoaderState createState() => _SplashLoaderState();
}

class _SplashLoaderState extends State<SplashLoader> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(duration: widget.duration, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animation = Tween<double>(begin: 0.0, end: context.size.width).animate(_animationController);
      _animationController.addListener(_updateState);
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(_updateState);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backColor,
              border: Border.all(
                width: widget.strokeWidth,
                style: widget.strokeWidth == 0.0 ? BorderStyle.none : BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _animationController.value * 10 <= 1 ? _animationController.value * 10 : 1,
            child: AnimatedContainer(
              height: widget.height,
              width: _animation?.value ?? 0,
              decoration: BoxDecoration(
                color: widget.color,
                gradient: widget.gradient,
                border: Border.all(
                  width: widget.strokeWidth,
                  style: widget.strokeWidth == 0.0 ? BorderStyle.none : BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(widget.radius),
              ),
              duration: const Duration(milliseconds: 400),
            ),
          ),
        ],
      ),
    );
  }

  void _updateState() => setState(() {});
}
