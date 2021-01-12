import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final void Function(Product) buyFunction;

  const ProductItem({
    @required Key key,
    @required this.product,
    @required this.buyFunction,
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
              imageUrl: product.imageUrl,
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
                      product?.title ?? '',
                      style: CustomTheme.textStyles.mainTextStyle(
                        size: 20.sp,
                      ),
                    ),
                    Text(
                      product?.description ?? '',
                      style: CustomTheme.textStyles.mainTextStyle(
                        size: 10.sp,
                      ),
                    ),
                    Text(
                      (product?.weight?.toString() ?? '0.0') + ' g',
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
                        '${product?.price ?? 0.0} грн',
                        style: CustomTheme.textStyles.accentTextStyle(
                          size: 16.sp,
                        ),
                      ),
                      SizedBox(height: 8.sp),
                      InkWell(
                        onTap: () => buyFunction(product),
                        child: Container(
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
