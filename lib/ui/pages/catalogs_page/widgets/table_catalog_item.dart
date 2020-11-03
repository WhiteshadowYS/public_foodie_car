import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

class TableCatalogItem extends StatelessWidget {
  final String locale;
  final String descriptionTitle;
  final CatalogModel catalog;

  TableCatalogItem({
    @required this.locale,
    @required this.descriptionTitle,
    @required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedImage(
              key: Key(key.toString() + 'CachedImage'),
              imageUrl: catalog.imageLink ?? '',
              height:  200.0,
              width: (ScreenUtil.screenWidth - 64) / 2,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Column(
              children: [
                Text(
                  catalog.titleForLanguage(locale),
                  style: CustomTheme.textStyles.titleTextStyle(
                    size: 18.sp,
                  ),
                ),

                Text(
                  catalog.descriptionForLanguage(locale),
                  textAlign: TextAlign.start,
                  style: CustomTheme.textStyles.mainTextStyle(
                    size: 12.sp,
                    height: 1.4,
                  ),
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
