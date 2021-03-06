import 'package:foodie_car_template/data/res/app_styles/default_app_colors.dart';
import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> shadowText(Color color) {
    return [
      BoxShadow(color: color, spreadRadius: 1.0, blurRadius: 4),
    ];
  }

  static List<BoxShadow> emptyShadow() {
    return [
      BoxShadow(color: DefaultAppColors.white.withOpacity(0)),
    ];
  }

  static List<BoxShadow> shadowsFile(Color color) {
    return [
      BoxShadow(
        offset: Offset(-1, 0),
        color: DefaultAppColors.white.withOpacity(0.2),
        blurRadius: 12.0,
      ),
      BoxShadow(
        offset: Offset(1, 0),
        color: color,
        spreadRadius: 16.0,
        blurRadius: 12.0,
      ),
    ];
  }
}
