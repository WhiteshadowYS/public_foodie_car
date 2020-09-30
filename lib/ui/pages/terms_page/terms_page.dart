import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/terms_page/terms_page_vm.dart';

class TermsPage extends StatelessWidget {
  TermsPage() : super(key: Key('TermsPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TermsPageVM>(
      converter: TermsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Terms Page'),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('To Catalogs Page'),
                onPressed: () => vm.navigateToCatalogsPage(),
              ),
            ],
          ),
        );
      }
    );
  }
}
