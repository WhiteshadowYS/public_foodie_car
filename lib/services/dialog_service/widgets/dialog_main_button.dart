import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogMainButton extends StatelessWidget {
  final void Function() onTap;
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final String keyValue;

  DialogMainButton({
    @required this.onTap,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.title,
    @required this.keyValue,
  }) : super(key: Key(keyValue));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomTheme.colors.primaryColor,
        ),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: textColor.withOpacity(0.4),
          highlightColor: textColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}