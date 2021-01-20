import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/products_page/products_page_vm.dart';
import 'package:foodie_client_template/ui/pages/products_page/widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: StoreConnector<AppState, ProductsPageVM>(
        converter: ProductsPageVM.init,
        onInitialBuild: (vm) => vm.getProducts(),
        builder: (BuildContext context, ProductsPageVM vm) {
          return MainLayout(
            key: Key('[ProductsPage]'),
            child: _buildContent(vm),
          );
        },
      ),
    );
  }

  Widget _buildContent(ProductsPageVM vm) {
    if (vm.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      itemCount: vm.products?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          key: Key('[ProductItem][$index]'),
          buyFunction: vm.addToBusket,
          openProductPage: (Product product) {
            vm.selectProduct(product);
            vm.gotoProductPage();
          },
          product: vm.products[index],
        );
      },
    );
  }
}
