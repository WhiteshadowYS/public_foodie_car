import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/widgets/fade_animation_container.dart';

class BottomBarItem extends StatelessWidget {
  final String iconUrl;
  final bool isSelected;
  final void Function() onTap;

  BottomBarItem({
    @required String key,
    @required this.iconUrl,
    @required this.isSelected,
    @required this.onTap,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(48.h),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.network(
            iconUrl,
            height: 32,
            color: isSelected ? CustomTheme.colors.primaryColor : CustomTheme.colors.primaryColor.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
