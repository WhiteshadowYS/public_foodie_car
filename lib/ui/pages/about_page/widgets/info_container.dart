import 'package:flutter/material.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoContainer extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoContainer({
    @required Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48.sp,
        height: 48.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: CustomTheme.colors.primaryColor,
          size: 32.sp,
        ),
      ),
      title: Text(
        text,
        style: CustomTheme.textStyles.mainTextStyle(),
      ),
    );
  }
}
