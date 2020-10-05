import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';

class BottomBarItem extends StatelessWidget {
  final String iconUrl;
  final void Function() onTap;

  BottomBarItem({
    @required this.iconUrl,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.network(
        iconUrl,
        height: 35,
        // TODO(Daniil): User theme color
        color: AppColors.kGreen,
      ),
    );
  }
}
