import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page_vm.dart';

class SingleProductPage extends StatelessWidget {
  SingleProductPage() : super(key: Key('SingleProductPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SingleProductPageVM>(
      converter: SingleProductPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Single Product Page'),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('To Settings Page'),
                onPressed: () => vm.navigateToSettingsPage(),
              ),
            ],
          ),
        );
      }
    );
  }
}
