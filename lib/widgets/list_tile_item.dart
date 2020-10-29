import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileItem extends StatelessWidget {
  final String keyValue;
  final String title;
  final String iconPath;
  final void Function() onTap;
  final String placeholderIcon;

  ListTileItem({
    @required this.keyValue,
    @required this.title,
    @required this.iconPath,
    @required this.onTap,
    @required this.placeholderIcon,
  }) : super(key: Key(keyValue + 'ListTileItem'));

  @override
  Widget build(BuildContext context) {
    final TextDirection directionality = StorageLanguageSelector.selectedLocaleDirection(StoreProvider.of(context));
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Directionality(
          textDirection: directionality,
          child: Column(
            children: [
              ListTile(
                key: Key(keyValue),
                leading: SvgPicture.network(
                  iconPath,
                  height: 28.sp,
                  color: CustomTheme.colors.footerIcons,
                  placeholderBuilder: (BuildContext context) {
                    return SvgPicture.asset(
                      placeholderIcon,
                      height: 28.sp,
                      color: CustomTheme.colors.primaryColor,
                    );
                  },
                ),
                title: Text(
                  title,
                  style: CustomTheme.textStyles.titleTextStyle(size: 12.sp),
                ),
                trailing: Transform.rotate(
                  angle: directionality == TextDirection.rtl ? pi : 0,
                  child: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              Container(
                color: CustomTheme.colors.accentColor.withOpacity(0.2),
                height: 1.5,
                margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

