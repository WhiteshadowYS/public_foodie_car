import 'package:flutter/material.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';

class AppGradient {
  static LinearGradient get mainGradient {
    return LinearGradient(
      colors: <Color>[
        AppColors.kPeach,
        AppColors.kYellowLight ,
        AppColors.kPinkLight,
        AppColors.kRedLight,
      ],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      stops: [0, 0.4, 0.6, 1.0],
    );
  }
  static LinearGradient get overflowTopGradient {
    return  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.kWhite,
        AppColors.kWhite.withOpacity(0.5),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }
  static LinearGradient get overflowBottomGradient {
    return  LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        AppColors.kWhite,
        AppColors.kWhite.withOpacity(0.5),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }
  static LinearGradient get overflowLeftGradient {
    return  LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        AppColors.kWhite,
        AppColors.kWhite.withOpacity(0.5),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }
  static LinearGradient get overflowRightGradient {
    return  LinearGradient(
      colors: [
        AppColors.kWhite,
        AppColors.kWhite.withOpacity(0.5),
        AppColors.kWhite.withOpacity(0.0),
      ],
    );
  }

}