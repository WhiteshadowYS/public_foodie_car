import 'package:flutter/material.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogMainButton extends StatelessWidget {
  final void Function() onTap;
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final String keyValue;
  final Color borderColor;

  DialogMainButton({
    @required this.onTap,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.title,
    @required this.keyValue,
    this.borderColor,
  }) : super(key: Key(keyValue));

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: MILLISECONDS_300,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? CustomTheme.colors.primaryColor,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0, 
          ),
          child: InkWell(
            splashColor: textColor.withOpacity(0.4),
            highlightColor: textColor.withOpacity(0.2),
            onTap: onTap,
            borderRadius: BorderRadius.circular(50.0),
            child: Padding(
              padding:  EdgeInsets.all(12.sp),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
