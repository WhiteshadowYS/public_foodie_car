import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    bool isLargeScreen = false;
    if (MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }
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
          crossAxisCount: 2 + (MediaQuery.of(context).size.width / 600.0).floor(),
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: isLargeScreen ? MediaQuery.of(context).devicePixelRatio * 0.35 : 0.75,
          children: getChildren(widgets) ?? [],
        ),
      ),
    );
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
