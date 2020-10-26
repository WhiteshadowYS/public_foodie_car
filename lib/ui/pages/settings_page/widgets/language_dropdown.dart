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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: CustomTheme.textStyles.mainTextStyle(size: 15.sp),
          ),
          const SizedBox(width: 16.0),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18,
            color: CustomTheme.colors.minorFont,
          ),
        ],
      ),
    );
  }
}