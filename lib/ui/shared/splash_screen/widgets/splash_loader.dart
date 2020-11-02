import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget [SplashLoader], is a load bar that will be filled
/// from start to finish, during the time [duration].
/// It must be passed to [duration] and [color] or [gradient].
/// With the [padding] variable we can set an indent for [SplashLoader].
/// The [height] parameter is responsible for height.
/// There are several parameters responsible for the style of the view.
/// [radius] is responsible for rounding the edges.
/// [strokeWidth] is the size of the contour.
/// [backColor] is the background color.
/// A large number of parameters allows you to easily set it up and
/// change it in case of changes, not changing the implementation.
class SplashLoader extends StatefulWidget {
  final LinearGradient gradient;
  final EdgeInsets padding;
  final double strokeWidth;
  final Duration duration;
  final double height;
  final double radius;
  final Color color;
  final Color backColor;

  ///The [strokeWidth] parameter is 0 by default.
  ///Therefore the contours will not be visible at the beginning.
  ///[height] if nothing is transmitted, the height will be equal to 2.
  ///[radius] will be equal to 11.
  ///[padding] is 70 horizontal by default.
  ///If there is no [duration] and [color] or [gradient] before, an error will occur.
  // ignore: use_key_in_widget_constructors
  SplashLoader({
    @required this.duration,
    this.strokeWidth = 0.0,
    this.height = 2.5,
    this.radius = 11.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 70.0),
    this.color,
    this.backColor,
    this.gradient,
  }) : assert(duration != null && (gradient != null || color != null));

  @override
  _SplashLoaderState createState() => _SplashLoaderState();
}

/// [_SplashLoaderState] connects SingleTickerProviderStateMixin,
/// for the functionality of [_animationController].
/// Variable [_animationController], responsible for starting the animation [_animation].
/// In [_animation], the main work with animation will take place.
class _SplashLoaderState extends State<SplashLoader> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  ///In [initState], a boot animation will be created.

  @override
  void initState() {
    ///The [_animationController] is initialized, it accepts
    ///the [duration] parameter, which is responsible for the time of filling the strip.
    _animationController = AnimationController(duration: widget.duration, vsync: this);

    ///In this function, we specify that we will initialize [_animation] after the first build.
    ///Its starting value is 0.0, and the final result is the length depending on the context.
    ///Here we also add the [_updateState] function as a listener.
    ///This function updates the state when the animation changes.
    ///Animation is also launched here.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animation = Tween<double>(begin: 0.0, end: context.size.width).animate(_animationController);
      _animationController.addListener(_updateState);
      _animationController.forward();
    });
    super.initState();
  }

  ///After [_animationController] removes the [_updateState] function from listeners.
  ///After that, the [_animationController] will call the dispose method.
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
                /// Depending on the fact that the variable [strokeWidth] is 0.
                /// In style, you will be asked whether or not to display the outline.
                style: widget.strokeWidth == 0.0 ? BorderStyle.none : BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
          ///AnimatedOpacity, here is necessary to make the loader look better visually when starting to move.
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            ///The boot will be opacity, only up to 10%, visually it is not visible, but it solves
            /// the problem with the fact that we see the loader before the start of drawing the boot.
            opacity: _animationController.value * 10 <= 1 ? _animationController.value * 10 : 1,
            child: AnimatedContainer(
              height: widget.height,
              width: _animation?.value ?? 0,
              decoration: BoxDecoration(
                color: widget.color,
                gradient: widget.gradient,
                border: Border.all(
                  width: widget.strokeWidth,
                  /// Depending on the fact that the variable [strokeWidth] is 0.
                  /// In style, you will be asked whether or not to display the outline.
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

  ///Fuction [_updateState], just to update the page state.
  void _updateState() => setState(() {});
}
