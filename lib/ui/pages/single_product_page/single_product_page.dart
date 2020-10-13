import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page_vm.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';

class SingleProductPage extends StatelessWidget {
  SingleProductPage() : super(key: Key('SingleProductPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SingleProductPageVM>(
      converter: SingleProductPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bgColor: AppColors.kWhite,
          appBar: MainAppBar(key: 'MainAppBar', title: 'SubCategoryTitle', backOnTap: () {}),
          bottomBar: BottomBar(key: 'BottomBar'),
          child: ListView(
            children: [
              Text('Single Product Page'),
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('To Settings Page'),
                onPressed: () => vm.navigateToSettingsPage(),
              ),
              RaisedButton(
                child: Text('File preview dialog'),
                onPressed: () => vm.filePreview(dummyFiles[2]),
              ),
            ],
          ),
        );
      },
    );
  }
}
