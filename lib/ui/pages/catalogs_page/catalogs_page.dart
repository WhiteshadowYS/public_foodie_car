import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/catalogs_page/catalogs_page_vm.dart';

class CatalogsPage extends StatelessWidget {
  CatalogsPage() : super(key: Key('CatalogsPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CatalogsPageVM>(
      converter: CatalogsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Catalogs Page'),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('To Categories Page'),
                onPressed: () => vm.navigateToCategoriesPage(),
              ),
            ],
          ),
        );
      }
    );
  }
}
