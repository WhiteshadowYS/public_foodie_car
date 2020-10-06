import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class BottomBarSwitchItem extends StatelessWidget {
  final FooterButtonModel footerButton;
  final void Function() onTap;

  BottomBarSwitchItem({
    @required this.onTap,
    @required this.footerButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.network(
            footerButton.iconSvg,
            height: 20.0,
            color: AppColors.kGreen,
          ),
          // TODO(Andrey): Get style from theme;
          title: Text(footerButton.type),
          trailing: Transform.rotate(
            angle: pi,
            child: SVGImages().backArrow(),
          ),
          onTap: onTap,
        ),
        const Divider(thickness: 1.5),
      ],
    );
    ;
  }
}
