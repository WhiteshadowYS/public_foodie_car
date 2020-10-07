import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';

class ListTileItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final void Function() onTap;

  ListTileItem({
    @required this.title,
    @required this.iconPath,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.network(
            iconPath,
            height: 20.0,
            color: AppColors.kGreen,
          ),
          // TODO(Andrey): Get style from theme;
          title: Text(title),
          trailing: Transform.rotate(
            angle: FlutterDictionary.instance.isRTL ? pi : 0,
            child: Icon(Icons.keyboard_arrow_right),
          ),
          onTap: onTap,
        ),
        const Divider(thickness: 1.5, indent: 10.0, endIndent: 10.0),
      ],
    );
  }
}
