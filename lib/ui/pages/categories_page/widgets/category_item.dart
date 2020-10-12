import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CategoryItem extends StatelessWidget {
  String imageUrl;
  String categoryName;

  CategoryItem({
    @required this.imageUrl,
    @required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: FadeInImage(
           height: 190,
            placeholder: AssetImage(ImageAssets.LOGO_PNG),
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          categoryName,
          style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
        ),
      ],
    );
  }
}
