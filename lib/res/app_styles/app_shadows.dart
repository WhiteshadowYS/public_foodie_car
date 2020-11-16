import 'package:flutter/material.dart';

import 'package:base_project_template/res/app_styles/app_colors.dart';

class AppShadows {
  static List<BoxShadow> shadowText(Color color) {
    return [
      BoxShadow(color: color, spreadRadius: 1.0, blurRadius: 4),
    ];
  }

  static List<BoxShadow> emptyShadow() {
    return [
      BoxShadow(color: AppColors.kWhite.withOpacity(0)),
    ];
  }

  static List<BoxShadow> shadowsFile(Color color) {
    return [
      BoxShadow(
        offset: Offset(-1, 0),
        color: AppColors.kWhite.withOpacity(0.2),
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
