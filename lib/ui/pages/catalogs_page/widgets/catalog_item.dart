import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

class CatalogItem extends StatelessWidget {
  final String keyValue;
  final String locale;
  final String descriptionTitle;
  final CatalogModel catalog;
  final void Function(int) navigateToCategories;

  CatalogItem({
    @required this.keyValue,
    @required this.locale,
    @required this.descriptionTitle,
    @required this.catalog,
    @required this.navigateToCategories,
  }) : super(key: Key(keyValue + 'CatalogItem'));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: InkWell(
          key: Key(keyValue),
          borderRadius: BorderRadius.circular(18.0),
          onTap: () => navigateToCategories(catalog.id),
          child: Column(
            children: [
               SizedBox(height: 14.sp),
              Text(
                catalog.titleForLanguage(locale),
                style: CustomTheme.textStyles.titleTextStyle(
                  size: 18.sp,
                ),
              ),
             SizedBox(height: 14.sp),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedImage(
                  key: Key(key.toString() + 'CachedImage'),
                  imageUrl: catalog.imageLink ?? '',
                  height: 172.sp,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 14.0),
              Text(
                descriptionTitle ?? '',
                style: CustomTheme.textStyles.titleTextStyle(
                  size: 14.sp,
                ),
              ),
              const SizedBox(height: 14.0),
              Text(
                catalog.descriptionForLanguage(locale),
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.mainTextStyle(
                  size: 12.sp,
                  height: 1.4,
                ),
                maxLines: 5,
              ),
               SizedBox(height: 14.sp),
            ],
          ),
        ),
      ),
    );
  }
}
