import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class SVGImages {
  Widget mcLogo({Color color}) {
    return SvgPicture.asset(
      'assets/svg/mc_logo.svg',
      color: color ?? CustomTheme.colors.primaryColor,
    );
  }

  Widget close({Color color}) {
    return SvgPicture.asset(
      'assets/svg/close.svg',
      height: 25.h,
      color: color ?? CustomTheme.colors.primaryColor,
    );
  }

  Widget backArrow({Color color}) {
    return SvgPicture.asset(
      'assets/svg/back_arrow.svg',
      color: color ?? CustomTheme.colors.primaryColor,
    );
  }
}
