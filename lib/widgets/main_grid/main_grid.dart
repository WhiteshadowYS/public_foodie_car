import 'package:flutter/material.dart';
import 'package:my_catalog/utils/clean_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainGrid extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  MainGrid({
    @required String key,
    @required this.itemCount,
    @required this.itemBuilder,
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
