import 'package:flutter/material.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleProductListItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final double radius;

  SingleProductListItem({
    @required this.title,
    this.radius = 8.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(backgroundColor: CustomTheme.colors.primaryColor, radius: radius, child: icon),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                title,
                style: CustomTheme.textStyles.titleTextStyle(size: 14),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
