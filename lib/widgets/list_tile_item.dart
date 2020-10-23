import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileItem extends StatelessWidget {
  final String keyValue;
  final String title;
  final String iconPath;
  final void Function() onTap;

  ListTileItem({
    @required this.keyValue,
    @required this.title,
    @required this.iconPath,
    @required this.onTap,
  }) : super(key: Key(keyValue + 'ListTileItem'));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            key: Key(keyValue),
            leading: SvgPicture.network(
              iconPath,
              height: 20.0,
              color: CustomTheme.colors.primaryColor,
            ),
            title: Text(title, style: CustomTheme.textStyles.titleTextStyle(size: 14.sp),),
            trailing: Transform.rotate(
              angle: FlutterDictionary.instance.isRTL ? pi : 0,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            onTap: onTap,
          ),
        ),
        const Divider(thickness: 1.5, indent: 10.0, endIndent: 10.0),
      ],
    );
  }
}

