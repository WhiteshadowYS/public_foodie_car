import 'package:flutter/material.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class MainGrid extends StatelessWidget {
  final List<Widget> widgets;

  MainGrid({
    @required String key,
    @required this.widgets,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
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
