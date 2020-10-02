import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';

class AcceptCheckBox extends StatelessWidget {
  final Duration duration;
  final bool accept;

  AcceptCheckBox({
    @required this.duration,
    @required this.accept,
  }) : super(key: Key('AcceptCheckBox'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0.h,
      height: 25.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.kGreyTwo.withOpacity(0.2),
      ),
      alignment: Alignment.center,
      child: AnimatedOpacity(
        opacity: accept ? 1 : 0,
        duration: Duration(milliseconds: (duration.inMilliseconds / 4).round()),
        child: Icon(
          Icons.check,
          size: 25.h,
          color: AppColors.kGreen,
        ),
      ),
    );
  }
}
