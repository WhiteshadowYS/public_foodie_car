import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final void Function() onTap;

  ProductItem({
    @required this.product,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String currentLocale = FlutterDictionaryDelegate.getCurrentLocale;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FadeInImage(
                width: 50.w,
                height: 50.w,
                placeholder: AssetImage(ImageAssets.LOGO_PNG),
                image: NetworkImage(product.imageLink),
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              product.languages[currentLocale.toUpperCase()][NAME],
              style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                product.languages[currentLocale.toUpperCase()][DESCRIPTION],
                style: CustomTheme.textStyles.mainTextStyle(size: 13.0),
              ),
            ),
            trailing: Transform.rotate(
              angle: FlutterDictionary.instance.isRTL ? pi : 0,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            onTap: onTap,
          ),
        ),
        const Divider(thickness: 1.5),
      ],
    );
  }
}
