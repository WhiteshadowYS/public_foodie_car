import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageDropdown extends StatelessWidget {
  final void Function() callback;
  final String text;
  final TextDirection textDirection;

  LanguageDropdown({
    @required String key,
    @required this.text,
    @required this.textDirection,
    this.callback,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: CustomTheme.textStyles.mainTextStyle(size: 15.sp),
          ),
          SizedBox(width: 16.0),
          Transform.rotate(
            angle: textDirection != TextDirection.ltr ? pi : 0.0,
            child: SizedBox(
              height: 20.sp,
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 18.sp,
                color: CustomTheme.colors.minorFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}