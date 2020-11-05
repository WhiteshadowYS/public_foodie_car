import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class MainGrid extends StatelessWidget {
  final String keyValue;
  final List<Widget> widgets;

  MainGrid({
    @required this.keyValue,
    @required this.widgets,
  }) : super(key: Key(keyValue + 'MainGrid'));

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > MIN_TABLET_WIDTH;
    final int crossAxisCount = 2 + (MediaQuery.of(context).size.width / MIN_TABLET_WIDTH).floor();
    return Container(
      margin: EdgeInsets.only(
        left: 16.sp,
        right: 16.sp,
        top: 16.sp,
      ),
      child: ScrollConfiguration(
        behavior: CleanBehavior(),
        child: GridView.count(
          physics: ClampingScrollPhysics(),
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 8.h,
          childAspectRatio: _gridAspectRatio(isLargeScreen, context),
          children: getChildren(widgets) ?? [],
        ),
      ),
    );
  }

  double _gridAspectRatio(bool isLargeScreen, BuildContext context) {
    if(isLargeScreen) {
      if(MediaQuery.of(context).size.width > MediaQuery.of(context).size.height) {
        return MediaQuery.of(context).size.aspectRatio / 2.4;
      }
      return MediaQuery.of(context).size.aspectRatio;
    }
    return 0.75;
  }

  List<Widget> getChildren(List<Widget> widgets) {
    if (widgets == null || widgets.isEmpty) {
      return [];
    }

    if (widgets.contains(null)) {
      widgets.removeWhere((w) => w == null);
    }

    return widgets;
  }
}
