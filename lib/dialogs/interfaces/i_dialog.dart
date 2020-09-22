import 'package:flutter/material.dart';

abstract class IDialog {
  void show(DisplayFunction display);
}

typedef DisplayFunction = void Function(BuilderFunction);
typedef BuilderFunction = Future<void> Function(BuildContext context);