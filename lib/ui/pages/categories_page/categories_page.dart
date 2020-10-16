import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/categories_page/categories_page_vm.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/widgets/main_grid/main_grid.dart';
import 'package:my_catalog/widgets/main_grid/main_grid_item.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage() : super(key: Key('CategoriesPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoriesPageVM>(
      converter: CategoriesPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          bottomBar: BottomBar(key: CategoriesPageKeys.bottomBar),
          appBar: MainAppBar(key: CategoriesPageKeys.appbar, title: 'Categories'),
          child: MainGrid(
            key: CategoriesPageKeys.gridView,
            itemCount: vm.categories.length,
            itemBuilder: (BuildContext context, int index) {
              final CategoryModel category = vm.getCurrentCategoryData(vm.categories[index].id);

              if (category == null) return Container();

              return MainGridItem(
                keyValue: CategoriesPageKeys.categoryItem + '$index',
                title: category.languages[vm.currentLocale][KEY_TITLE],
                imageUrl: category.imageLink,
                index: index,
                onTap: () => vm.navigateToSubcategoriesPage(category.id),
              );
            },
          ),
        );
      },
    );
  }
}
