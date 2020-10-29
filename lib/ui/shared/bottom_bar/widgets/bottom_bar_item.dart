import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class BottomBarItem extends StatelessWidget {
  final String iconUrl;
  final String placeholderIcon;
  final bool isSelected;
  final void Function() onTap;

  BottomBarItem({
    @required String key,
    @required this.iconUrl,
    @required this.placeholderIcon,
    @required this.isSelected,
    @required this.onTap,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(48.h),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? CustomTheme.colors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(48.h),
            ),
            padding: EdgeInsets.all(12.w),
            child: SvgPicture.network(
              iconUrl,
              height: 32.h,
              color: isSelected ? CustomTheme.colors.background : CustomTheme.colors.primaryColor,
              placeholderBuilder: (BuildContext context) {
                return SvgPicture.asset(
                  placeholderIcon,
                  height: 32.h,
                  color: isSelected ? CustomTheme.colors.background : CustomTheme.colors.primaryColor,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
