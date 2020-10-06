import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';

class BottomBarItem extends StatelessWidget {
  final String iconUrl;
  final bool isSelected;
  final void Function() onTap;

  BottomBarItem({
    @required this.iconUrl,
    @required this.isSelected,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.network(
        iconUrl,
        height: 35.0,
        // TODO(Daniil): User theme color
        color: isSelected ? AppColors.kGreen : AppColors.kGreen.withOpacity(0.5),
      ),
    );
  }
}
