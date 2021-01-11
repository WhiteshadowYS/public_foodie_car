import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    @required Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CustomTheme.colors.background,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.24),
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 4.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      height: 160.sp,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.url,
            ),
          ),
          const SizedBox(width: 24.0),
          Expanded(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: CustomTheme.textStyles.mainTextStyle(
                        size: 20.sp,
                      ),
                    ),
                    Text(
                      'Продукты',
                      style: CustomTheme.textStyles.mainTextStyle(
                        size: 10.sp,
                      ),
                    ),
                    Text(
                      'Вес',
                      style: CustomTheme.textStyles.mainTextStyle(
                        size: 10.sp,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  child: Column(
                    children: [
                      Text(
                        '200 грн',
                        style: CustomTheme.textStyles.accentTextStyle(
                          size: 16.sp,
                        ),
                      ),
                      SizedBox(height: 8.sp),
                      Container(
                        alignment: Alignment.center,
                        height: 28.sp,
                        width: 100.sp,
                        decoration: BoxDecoration(
                          color: CustomTheme.colors.buttons,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Купить',
                          style: CustomTheme.textStyles.buttonTextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String url;
  final String name;
  final double price;

  const Product({
    this.name,
    this.price,
    this.url,
  });
}
