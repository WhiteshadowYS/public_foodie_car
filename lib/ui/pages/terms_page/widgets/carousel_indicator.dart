import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CarouselIndicator extends StatelessWidget {
  final bool isSelected;
  CarouselIndicator({@required this.isSelected}) : super(key: Key(TermsPageKeys.carouselIndicator));
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0.sp, left: 4.0.sp),
      width: 10.0.sp,
      height: 10.0.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: CustomTheme.colors.primaryColor),
        color: isSelected ? CustomTheme.colors.primaryColor : CustomTheme.colors.background,
      ),
    );
  }
}
