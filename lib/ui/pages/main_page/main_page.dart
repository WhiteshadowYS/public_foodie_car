import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';

class MainPage extends StatelessWidget {
  MainPage() : super(key: Key('MainPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Main Page'),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('To Terms Page'),
                onPressed: () => vm.navigateToTermsPage(),
              ),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('Get Storage Data'),
                onPressed: () => vm.getData(),
              ),
            ],
          ),
        );
      }
    );
  }
}
