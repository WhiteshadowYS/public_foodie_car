import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/pages/catalogs_page/widgets/phone_catalog_item.dart';
import 'package:my_catalog/ui/pages/catalogs_page/widgets/table_catalog_item.dart';
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
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
              key: Key(keyValue),
              borderRadius: BorderRadius.circular(18.0),
              onTap: () => navigateToCategories(catalog.id),
              child: _getCurrentChild()),
        ),
      ),
    );
  }

  Widget _getCurrentChild() {
    if (ScreenUtil.screenWidth > MIN_TABLET_WIDTH) {
      return TableCatalogItem(
        descriptionTitle: descriptionTitle,
        catalog: catalog,
        locale: locale,
      );
    }
    return PhoneCatalogItem(
      descriptionTitle: descriptionTitle,
      catalog: catalog,
      locale: locale,
    );
  }
}
