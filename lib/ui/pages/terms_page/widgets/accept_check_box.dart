import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';

///Responsible for checkBox state in [AgreeButton]
///Takes 2 required parameters [duration] [accept]
///[duration] is responsible for the checkIcon display time
///[accept] which indicates whether the check icon should be shown
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
      ///if [accept] true, opacity of check icon is 100%, if false - opacity 0%
      child: AnimatedOpacity(
        opacity: accept ? 1 : 0,
        /// [duration] is divided by 4 so the user can see the check icon before the page changes
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
