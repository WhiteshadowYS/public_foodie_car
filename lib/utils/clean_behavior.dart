import 'package:flutter/material.dart';

class CleanBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class CleanedListView extends StatelessWidget {
  final List<Widget> children;

  const CleanedListView({
    this.children,
  }) : super(key: const Key('CleanedListView'));

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CleanBehavior(),
      child: ListView(
        children: children,
      ),
    );
  }
}
