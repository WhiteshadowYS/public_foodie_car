import 'package:flutter/material.dart';
import 'package:my_catalog/utils/clean_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainGrid extends StatelessWidget {
  final List<Widget> widgets;

  MainGrid({
    @required String key,
    @required this.widgets,
  }) : super(key: Key(key));

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
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
          children: getChildren(widgets),
        ),
      ),
    );
  }

  List<Widget> getChildren(List<Widget> widgets) {
    if (widgets.contains(null)) {
      widgets.remove(null);
    }

    return widgets;
  }
}
