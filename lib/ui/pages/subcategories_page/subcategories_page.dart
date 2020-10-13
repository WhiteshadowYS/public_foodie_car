import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/subcategories_page/subcategories_page_vm.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';

class SubcategoriesPage extends StatelessWidget {
  SubcategoriesPage() : super(key: Key('SubcategoriesPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubcategoriesPageVM>(
        converter: SubcategoriesPageVM.fromStore,
        builder: (BuildContext context, vm) {
          return MainLayout(
            bottomBar: BottomBar(key: 'SubCategoriesBottomBar'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Subcategories Page'),
                const SizedBox(height: 24.0),
                RaisedButton(
                  child: Text('To Products Page'),
                  onPressed: () => vm.navigateToProductsPage(),
                ),
              ],
            ),
          );
        });
  }
}
