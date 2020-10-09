import 'package:flutter/material.dart';

import 'clean_behavior.dart';
import 'list_overflow_borders.dart';

class MainListView extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double height;
  final double itemHeight;
  final scrollDirection;
  final ScrollController scrollController;

  const MainListView({
    @required this.itemBuilder,
    @required this.itemCount,
    @required this.height,
    @required this.itemHeight,
    @required this.scrollController,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollConfiguration(
        behavior: CleanBehavior(),
        child: SizedBox(
          height: height ?? double.infinity,
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: scrollDirection,
            controller: scrollController,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}
