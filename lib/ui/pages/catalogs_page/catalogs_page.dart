import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/catalogs_page/catalogs_page_vm.dart';
import 'package:my_catalog/ui/pages/catalogs_page/widgets/catalog_item.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class CatalogsPage extends StatelessWidget {
  CatalogsPage() : super(key: Key('CatalogsPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CatalogsPageVM>(
      converter: CatalogsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 36.h,
                    child: SVGImages().mcLogo(),
                  ),
                ),
                const SizedBox(height: 35.0),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CleanBehavior(),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14.0,
                      ),
                      itemCount: vm.catalogs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CatalogItem(
                          key: 'CatalogItem$index',
                          catalog: vm.catalogs[index],
                          navigateToCategories: vm.navigateToCategoriesPage,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
