import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  void dispose() {
   controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final bool isTablet = MediaQuery.of(context).size.width > 600;
    return OrientationBuilder(builder: (context, orientation){
      final double horizontalTabletMargin = orientation == Orientation.landscape ? 60.sp : 10.sp;
      return Container(
        color: CustomTheme.colors.background.withOpacity(0.01),
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Material(
            color: Colors.transparent,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: Center(
                child: Container(
                  margin: widget.margin ?? EdgeInsets.symmetric(horizontal: isTablet? horizontalTabletMargin : 16.sp),
                  padding: widget.margin ??  EdgeInsets.symmetric(vertical: 4.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: widget.background ?? CustomTheme.colors.popupBackground,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      );
    },);

  }
}
