import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/app_styles/app_gradient.dart';
import 'package:my_catalog/res/const.dart';

class ListOverflowBorders extends StatelessWidget {
  final double maxHeight;
  final bool scrollUp;
  final bool scrollDown;
  final scrollDirection;

  ListOverflowBorders({
    this.maxHeight,
    this.scrollDown,
    this.scrollUp,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (scrollDirection == Axis.vertical)
          IgnorePointer(
            child: AnimatedOpacity(
              duration: MILLISECONDS_200,
              opacity: scrollUp ? 1 : 0,
              child: Container(
                height: maxHeight / 3,
                decoration: BoxDecoration(gradient: AppGradient.overflowTopGradient),
              ),
            ),
          ),
        if (scrollDirection == Axis.vertical)
          IgnorePointer(
            child: Container(
              height: maxHeight,
              alignment: Alignment.bottomCenter,
              child: AnimatedOpacity(
                duration: MILLISECONDS_200,
                opacity: scrollDown ? 1 : 0,
                child: Container(
                  height: maxHeight / 6,
                  decoration: BoxDecoration(gradient: AppGradient.overflowBottomGradient),
                ),
              ),
            ),
          ),
        if (scrollDirection == Axis.horizontal)
          IgnorePointer(
            child: AnimatedOpacity(
              duration: MILLISECONDS_200,
              opacity: _getCurrentScrollDown(context) ? 1 : 0,
              child: Container(
                alignment: Alignment.centerRight,
                child: Container(
                  width: maxHeight / 6,
                  decoration: BoxDecoration(gradient: AppGradient.overflowLeftGradient),
                ),
              ),
            ),
          ),
        if (scrollDirection == Axis.horizontal)
          IgnorePointer(
            child: Container(
              width: maxHeight,
              alignment: Alignment.centerLeft,
              child: AnimatedOpacity(
                duration: MILLISECONDS_200,
                opacity: _getCurrentScrollUp(context) ? 1 : 0,
                child: SizedBox(
                  width: maxHeight / 4,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(gradient: AppGradient.overflowRightGradient),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  bool _getCurrentScrollUp(BuildContext context) {
    return FlutterDictionary.instance.isRTL ? !scrollUp : scrollUp;
  }

  bool _getCurrentScrollDown(BuildContext context) {
    return FlutterDictionary.instance.isRTL ? !scrollDown : scrollDown;
  }
}
