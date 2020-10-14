import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class ProductItem extends StatelessWidget {
  final String keyValue;
  final ProductModel product;
  final void Function() onTap;

  ProductItem({
    @required this.keyValue,
    @required this.product,
    @required this.onTap,
  }) : super(key: Key(keyValue + 'ProductItem'));

  @override
  Widget build(BuildContext context) {
    final String currentLocale = FlutterDictionaryDelegate.getCurrentLocale;
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
              child: FadeInImage(
                width: 50.h,
                height: 50.h,
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
          Container(
            height: 1.5,
            color: Colors.grey.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
