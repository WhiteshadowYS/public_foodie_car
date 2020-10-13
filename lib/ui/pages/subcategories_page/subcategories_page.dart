import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/res/const.dart';
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
          bottomBar: BottomBar(key: 'SubCategoriesBottomBar'),
          appBar: MainAppBar(key: 'MainAppBar', title: 'SubCategories', backOnTap: () {}),
          child: MainGrid(
            key: 'SubCategoriesGrid',
            itemCount: vm.getSubCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return MainGridItem(
                key: 'MainGridItem$index',
                title: vm.getSubCategories[index].languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()]
                    [NAME],
                imageUrl: vm.getSubCategories[index].imageLink,
                index: index,
                onTap: () => vm.navigateToProductsPage(vm.getSubCategories[index].id.toString()),
              );
            },
          ),
        );
      },
    );
  }
}
