import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/subcategories_page/subcategories_page_vm.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/widgets/main_grid/main_grid.dart';
import 'package:my_catalog/widgets/main_grid/main_grid_item.dart';

class SubcategoriesPage extends StatelessWidget {
  SubcategoriesPage() : super(key: Key('SubcategoriesPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubcategoriesPageVM>(
      converter: SubcategoriesPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          bottomBar: BottomBar(key: SubCategoriesPageKeys.bottomBar),
          appBar: MainAppBar(
            height: 50.sp,
            key: SubCategoriesPageKeys.appbar,
            title: vm.subcategoriesPageTitle(vm.currentLocale),
            backButtonText: vm.backButtonText(vm.currentLocale),
          ),
          child: MainGrid(
            keyValue: CategoriesPageKeys.gridView,
            widgets: vm.subCategories.map((InfoSubcategoryModel infoSubcategory) {
              return getItem(
                vm: vm,
                infoSubcategory: infoSubcategory,
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget getItem({SubcategoriesPageVM vm, InfoSubcategoryModel infoSubcategory}) {
    try {
      final SubcategoryModel subcategory = vm.getCurrentSubCategoryData(infoSubcategory.id);

      int index;

      try {
        index = vm.subCategories.indexOf(infoSubcategory);
      } catch (e) {
        index = 0;
      }

      if (subcategory == null) return null;

      return MainGridItem(
        keyValue: SubCategoriesPageKeys.subcategoryItem + '${subcategory.id}',
        title: subcategory.titleForLanguage(vm.currentLocale),
        imageUrl: subcategory.imageLink,
        index: index,
        onTap: () => vm.navigateToProductsPage(subcategory.id),
      );
    } catch (e) {
      return null;
    }
  }
}
