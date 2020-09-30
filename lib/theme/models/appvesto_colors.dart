import 'package:flutter/painting.dart';
import 'package:my_catalog/theme/interfaces/i_appvesto_colors.dart';

class AVColors implements IAVColors {
  @override
  Color primaryColor;
  @override
  Color accentColor;
  @override
  Color activeColor;
  @override
  Color inActiveColor;

  AVColors({
    this.primaryColor,
    this.accentColor,
    this.activeColor,
    this.inActiveColor,
  });
}