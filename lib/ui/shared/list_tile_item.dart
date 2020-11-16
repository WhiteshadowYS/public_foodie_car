import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:base_project_template/theme/custom_theme.dart';
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: ListTile(
                key: Key(keyValue),
                leading: SvgPicture.network(
                  iconPath,
                  height: 32,
                  color: CustomTheme.colors.footerIcons,
                  placeholderBuilder: (BuildContext context) {
                    return SvgPicture.asset(
                      placeholderIcon,
                      height: 32,
                      color: CustomTheme.colors.primaryColor,
                    );
                  },
                ),
                title: Text(
                  title,
                  style: CustomTheme.textStyles.titleTextStyle(size: 14.h),
                ),
                trailing: Transform.rotate(
                  angle: 0,
                  child: Icon(Icons.keyboard_arrow_right,size: 24.h, color: CustomTheme.colors.footerIcons),
                ),
              ),
            ),
            Container(
              color: CustomTheme.colors.accentColor.withOpacity(0.2),
              height: 1.5.h,
              margin:  EdgeInsets.only(left: 12.0, right: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}

