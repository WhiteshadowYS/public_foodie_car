import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsTextBlock extends StatelessWidget {
  final String subtitle;
  final String termsText;

  TermsTextBlock({
    @required this.subtitle,
    @required this.termsText,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: CustomTheme.textStyles.titleTextStyle(size: 16.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            termsText,
            style: CustomTheme.textStyles.mainTextStyle(size: 14.sp),
          ),
        ],
      ),
    );
  }
}
