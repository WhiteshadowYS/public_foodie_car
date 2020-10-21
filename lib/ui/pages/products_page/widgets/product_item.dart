import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

class ProductItem extends StatelessWidget {
  final String keyValue;
  final String locale;
  final ProductModel product;
  final void Function() onTap;

  ProductItem({
    @required this.keyValue,
    @required this.locale,
    @required this.product,
    @required this.onTap,
  }) : super(key: Key(keyValue + 'ProductItem'));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          ListTile(
            key: Key(keyValue),
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: CachedImage(
                width: 50.sp,
                height: 50.sp,
                key: Key(key.toString() + 'CachedImage'),
                imageUrl: product.imageLink ?? '',
              ),
            ),
            title: Text(
              product.titleForLanguage(locale),
              style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                product.descriptionForLanguage(locale),
                style: CustomTheme.textStyles.mainTextStyle(size: 13.0),
                maxLines: 7,
                overflow: TextOverflow.visible,
              ),
            ),
            trailing: Transform.rotate(
              angle: FlutterDictionary.instance.isRTL ? pi : 0,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            onTap: onTap,
          ),
          Container(
            height: 1.5,
            color: Colors.grey.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
