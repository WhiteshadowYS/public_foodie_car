import 'package:flutter/material.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

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
      margin: const EdgeInsets.all(16.0),
      child: ScrollConfiguration(
        behavior: CleanBehavior(),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.8,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
