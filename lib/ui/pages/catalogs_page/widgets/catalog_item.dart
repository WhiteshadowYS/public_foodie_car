import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CatalogItem extends StatelessWidget {
  final CatalogModel catalog;
  final void Function(String) navigateToCategories;

  CatalogItem({
    @required String key,
    @required this.catalog,
    @required this.navigateToCategories,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18.0),
        splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
        highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
        onTap: () => navigateToCategories(catalog.id.toString()),
        child: Column(
          children: [
            const SizedBox(height: 14.0),
            Text(
              catalog.titleForLanguage('EN'),
              style: CustomTheme.textStyles.titleTextStyle(
                size: 18.h,
              ),
            ),
            const SizedBox(height: 14.0),
            Container(
              height: 172.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(catalog.imageLink),
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            Text(
              'Description',
              style: CustomTheme.textStyles.titleTextStyle(
                size: 14.h,
              ),
            ),
            const SizedBox(height: 14.0),
            Text(
              catalog.descriptionForLanguage('EN'),
              textAlign: TextAlign.center,
              style: CustomTheme.textStyles.mainTextStyle(
                size: 13.h,
                height: 1.4.h,
              ),
            ),
            const SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }
}
