import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/categories_page/categories_page_vm.dart';
import 'package:my_catalog/ui/pages/categories_page/widgets/category_item.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage() : super(key: Key('CategoriesPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoriesPageVM>(
      converter: CategoriesPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.background,
          bottomBar: BottomBar(key: 'CategoriesBottomBar'),
          appBar: MainAppBar(key: 'MainAppBar', title: 'Categories', backOnTap: () {}),
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: ScrollConfiguration(
              behavior: CleanBehavior(),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: vm.getCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(
                    key: 'CategoryItem$index',
                    category: vm.getCategories[index],
                    index: index,
                    onTap: vm.navigateToSubcategoriesPage,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
