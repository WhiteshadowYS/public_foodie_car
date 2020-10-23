import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageDropdown extends StatelessWidget {
  final void Function() callback;
  final String text;

  LanguageDropdown({
    @required String key,
    @required this.text,
    this.callback,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0.h,
      width: 108.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                text,
                style: CustomTheme.textStyles.mainTextStyle(size: 15.sp),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: CustomTheme.colors.minorFont,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: CustomTheme.colors.minorFont,
          ),
        ],
      ),
    );
  }
}