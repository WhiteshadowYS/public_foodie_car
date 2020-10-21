import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/res/image_assets.dart';
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
      child: InkWell(
        key: Key(keyValue),
        borderRadius: BorderRadius.circular(18.0),
        splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
        highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
        onTap: () => navigateToCategories(catalog.id),
        child: Column(
          children: [
            const SizedBox(height: 14.0),
            Text(
              catalog.titleForLanguage(locale),
              style: CustomTheme.textStyles.titleTextStyle(
                size: 18.sp,
              ),
            ),
            const SizedBox(height: 14.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedImage(
                key: Key(key.toString() + 'CachedImage'),
                imageUrl: catalog.imageLink ?? '',
                height: 172.h,
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
                size: 13.sp,
                height: 1.4.h,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }
}
