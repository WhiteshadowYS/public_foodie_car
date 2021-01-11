import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_client_template/data/res/app_styles/app_shadows.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';

class BusketItemModel {
  final int id;
  final String name;
  final String url;
  final double price;

  const BusketItemModel({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.url,
  });
}

class BusketItem extends StatelessWidget {
  final BusketItemModel item;
  final void Function() delete;

  BusketItem({
    @required this.item,
    @required this.delete,
  }) : super(key: Key('[BusketItem][${item.id}]'));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 24.0,
      ),
      padding: const EdgeInsets.all(12.0),
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
      height: 84.sp,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 60.sp,
              width: 60.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(item.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.sp),
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Text(
                    item?.name ?? '',
                    style: CustomTheme.textStyles.accentTextStyle(
                      color: CustomTheme.colors.font,
                      size: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: Text(
                    (item?.price?.toString() ?? '0.0') + ' грн',
                    style: CustomTheme.textStyles.accentTextStyle(
                      color: CustomTheme.colors.errorColor,
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.sp),
          Container(
            height: 24.sp,
            width: 24.sp,
            decoration: BoxDecoration(
              color: CustomTheme.colors.errorColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.close,
              color: CustomTheme.colors.background,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
