import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/products_page/products_page_vm.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage() : super(key: Key('ProductsPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProductsPageVM>(
      converter: ProductsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Products Page'),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('To Single Product Page'),
                onPressed: () => vm.navigateToSingleProductPagePage(),
              ),
            ],
          ),
        );
      }
    );
  }
}
