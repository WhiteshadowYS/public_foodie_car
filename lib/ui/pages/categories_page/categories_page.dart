import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/categories_page/categories_page_vm.dart';
import 'package:foodie_client_template/ui/pages/categories_page/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoriesPageVM>(
      converter: CategoriesPageVM.init,
      onInitialBuild: (vm) => vm.getCategories(),
      builder: (BuildContext context, CategoriesPageVM vm) {
        return MainLayout(
          key: Key('[CategoriesPage][MainLayout][Key]'),
          child: _buildContent(vm),
        );
      },
    );
  }

  Widget _buildContent(CategoriesPageVM vm) {
    if (vm.isLoading && vm.categories == null || vm.categories.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: vm.categories?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return CategoryItem(
            index: index,
            gotoProducts: (Category category) {
              vm.selectCategory(category);
              vm.gotoProductsPage();
            },
            category: vm.categories[index],
          );
        },
      ),
    );
  }
}
