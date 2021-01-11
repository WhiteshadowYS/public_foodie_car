import 'package:flutter/material.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      key: Key('[UnknownPage][MainLayout]'),
      child: Center(
        child: Text('Unknown Page'),
      ),
    );
  }
}
