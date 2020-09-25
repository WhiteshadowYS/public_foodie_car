import 'package:flutter/painting.dart';
import 'package:pictures_view/theme/interfaces/i_appvesto_colors.dart';

class AVColors implements IAVColors {
  @override
  Color primaryColor;
  @override
  Color accentColor;

  AVColors({
    this.primaryColor,
    this.accentColor,
  });
}