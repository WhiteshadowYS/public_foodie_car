import 'package:flutter/material.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';

class AppShadows {
  static List<BoxShadow> shadowsFile(Color color) {
    return [
      BoxShadow(
        offset: Offset(-1,0),
        color: AppColors.kWhite.withOpacity(0.2),
        blurRadius: 12.0,
      ),
      BoxShadow(
        offset: Offset(1,0),
        color: color,
        spreadRadius: 16.0,
        blurRadius: 12.0,
      ),
    ];
  }
}
