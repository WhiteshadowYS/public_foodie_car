import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItem extends StatelessWidget {
  final String text;
  final Widget child;
  final Function callback;

  SettingsItem({
    @required String key,
    @required this.text,
    @required this.child,
    @required this.callback,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: callback,
        child: Container(
          height: 76.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16.sp,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: CustomTheme.textStyles.titleTextStyle(size: 14.sp),
                    ),
                    child,
                  ],
                ),
              ),
              Container(
                height: 1.h,
                width: double.infinity,
                color: CustomTheme.colors.font.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}