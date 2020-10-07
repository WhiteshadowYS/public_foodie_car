import 'package:flutter/painting.dart';

abstract class IAVTextStyles {

  TextStyle titleTextStyle({double size, double height});

  TextStyle mainTextStyle({double size, double height});

  IAVTextStyles copyWith({
    String fontFamily,
    Color titleTextColor,
    Color mainTextColor,
    Color additionalTextColor,
  });
}
