import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/categories_page/categories_page_vm.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage() : super(key: Key('CategoriesPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoriesPageVM>(
      converter: CategoriesPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bottomBar: BottomBar(key: 'CategoriesBottomBar'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Categories Page'),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('To Subcategories Page'),
                onPressed: () => vm.navigateToSubcategoriesPage(),
              ),
            ],
          ),
        );
      }
    );
  }
}
