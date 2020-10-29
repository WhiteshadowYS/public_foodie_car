import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageViewButton extends StatelessWidget {
  final String keyValue;
  final IconData icon;
  final void Function() jumpToPage;

  ImageViewButton({
    this.keyValue,
    this.icon,
    this.jumpToPage,
  }) : super(key: Key(keyValue + 'ImageViewButton'));

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.kBlack.withOpacity(0.4),
          size: 32.sp,
        ),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: IconButton(
            key: Key(keyValue),
            icon: Icon(icon),
            color: CustomTheme.colors.buttons,
            iconSize: 31.sp,
            onPressed: jumpToPage,
            splashRadius: 20,
          ),
        ),
      ],
    );
  }
}
