import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/products_page/products_page_vm.dart';
import 'package:my_catalog/ui/pages/products_page/widgets/product_item.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/utils/clean_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage() : super(key: Key('ProductsPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsPageVM>(
      converter: ProductsPageVM.fromStore,
      builder: (BuildContext context, ProductsPageVM vm) {
        return MainLayout(
          bgColor: AppColors.kWhite,
          appBar: MainAppBar(
            key: ProductsPageKeys.appbar,
            backButtonText: vm.backButtonText(
              vm.currentLocale,
            ),
            title: vm.productsPageTitle(
              vm.currentLocale,
            ),
          ),
          bottomBar: BottomBar(key: ProductsPageKeys.bottomBar),
          child: Container(margin: EdgeInsets.only(
            top: 20.sp,
          ),
            child: ScrollConfiguration(
              behavior: CleanBehavior(),
              child: ListView.builder(
                key: Key(ProductsPageKeys.listView),
                physics: ClampingScrollPhysics(),
                itemCount: vm.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final ProductModel product = vm.getCurrentProductData(vm.products[index].id);

                  if (product == null) return Container();

                  return ProductItem(
                    keyValue: ProductsPageKeys.productItem,
                    product: product,
                    textDirection: vm.textDirection,
                    locale: vm.currentLocale,
                    onTap: () => vm.navigateToSingleProductPagePage(product.id),
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
