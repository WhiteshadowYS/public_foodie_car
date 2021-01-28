import 'package:foodie_car_template/data/res/app_styles/default_app_colors.dart';
import 'package:flutter/material.dart';

class AppGradient {
  static LinearGradient get mainGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        DefaultAppColors.orange,
        DefaultAppColors.yellow,
      ],
    );
  }

  static LinearGradient get overflowTopWhiteGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        DefaultAppColors.white.withOpacity(1.0),
        DefaultAppColors.white.withOpacity(0.6),
        DefaultAppColors.white.withOpacity(0.3),
        DefaultAppColors.white.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowBottomWhiteGradient {
    return LinearGradient(
      end: Alignment.topCenter,
      begin: Alignment.bottomCenter,
      colors: [
        DefaultAppColors.white.withOpacity(1.0),
        DefaultAppColors.white.withOpacity(0.6),
        DefaultAppColors.white.withOpacity(0.3),
        DefaultAppColors.white.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowTopGradient {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        DefaultAppColors.lightGrey.withOpacity(0.2),
        DefaultAppColors.lightGrey.withOpacity(0.1),
        DefaultAppColors.lightGrey.withOpacity(0.05),
        DefaultAppColors.lightGrey.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowBottomGradient {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        DefaultAppColors.lightGrey.withOpacity(0.2),
        DefaultAppColors.lightGrey.withOpacity(0.1),
        DefaultAppColors.lightGrey.withOpacity(0.05),
        DefaultAppColors.lightGrey.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowLeftGradient {
    return LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        DefaultAppColors.lightGrey.withOpacity(0.2),
        DefaultAppColors.lightGrey.withOpacity(0.1),
        DefaultAppColors.lightGrey.withOpacity(0.05),
        DefaultAppColors.lightGrey.withOpacity(0.0),
      ],
    );
  }

  static LinearGradient get overflowRightGradient {
    return LinearGradient(
      colors: [
        DefaultAppColors.lightGrey.withOpacity(0.2),
        DefaultAppColors.lightGrey.withOpacity(0.1),
        DefaultAppColors.lightGrey.withOpacity(0.05),
        DefaultAppColors.lightGrey.withOpacity(0.0),
      ],
    );
  }
}
