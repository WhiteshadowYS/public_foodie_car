import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGImages {
  Widget mcLogo({Color color = const Color(0xFF5DB075)}) {
    return SvgPicture.asset(
      'assets/svg/mc_logo.svg',
      color: color,
    );
  }
  Widget close({Color color = const Color(0xFF5DB075)}) {
    return SvgPicture.asset(
      'assets/svg/close.svg',
      color: color,
    );
  }
  Widget backArrow({Color color = const Color(0xFF5DB075)}) {
    return SvgPicture.asset(
      'assets/svg/back_arrow.svg',
      color: color,
    );
  }
}