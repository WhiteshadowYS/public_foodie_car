import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/products_page/products_page_vm.dart';
import 'package:my_catalog/ui/pages/products_page/widgets/product_item.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/utils/clean_behavior.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage() : super(key: Key('ProductsPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsPageVM>(
      converter: ProductsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bgColor: AppColors.kWhite,
          appBar: MainAppBar(
            key: 'MainAppBar',
            title: 'SubCategoryTitle',
            backOnTap: () {},
          ),
          bottomBar: BottomBar(key: 'BottomBar'),
          child: ScrollConfiguration(
            behavior: CleanBehavior(),
            child: ListView.builder(
              itemCount: vm.products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(
                  product: vm.products[index],
                  onTap: () {
                    vm.selectProduct(vm.products[index].id);
                    vm.navigateToSingleProductPagePage();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
