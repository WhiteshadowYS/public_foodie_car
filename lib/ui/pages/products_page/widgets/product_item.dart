import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';

class ProductItem extends StatelessWidget {
  final String keyValue;
  final String locale;
  final ProductModel product;
  final TextDirection textDirection;
  final void Function() onTap;

  ProductItem({
    @required this.keyValue,
    @required this.locale,
    @required this.product,
    @required this.onTap,
    @required this.textDirection,
  }) : super(key: Key(keyValue + 'ProductItem'));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: CachedImage(
                      width: 55.h,
                      height: 55.h,
                      key: Key(key.toString() + 'CachedImage'),
                      imageUrl: product.imageLink ?? EMPTY_STRING,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.titleForLanguage(locale),
                            style: CustomTheme.textStyles.titleTextStyle(size: 16.h),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              product.descriptionForLanguage(locale),
                              style: CustomTheme.textStyles.mainTextStyle(size: 14.h),
                              maxLines: 7,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: textDirection == TextDirection.ltr ? 0 : pi,
                    child: Icon(Icons.keyboard_arrow_right, size: 24.h),
                  ),
                ],
              ),
              Container(
                height: 1.5,
                color: Colors.grey.withOpacity(0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
