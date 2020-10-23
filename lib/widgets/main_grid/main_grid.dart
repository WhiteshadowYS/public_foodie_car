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
    return Container(
      margin: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      child: ScrollConfiguration(
        behavior: CleanBehavior(),
        child: GridView.count(
          physics: ClampingScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
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
