import 'package:base_project_template/services/route_service/models/routes.dart';
import 'package:base_project_template/ui/pages/main_page/main_page_vm.dart';
import 'package:flutter/material.dart';

import 'package:base_project_template/ui/layouts/main_layout/main_layout.dart';

class UnknownPage extends StatelessWidget {
  UnknownPage() : super(key: Key('UnknownPage'));

  @override
  Widget build(BuildContext context) {
    return MainLayout<MainPageVM>(
      key: Key('UnknownPageKey'),
      converter: MainPageVM.fromStore,
      appBarWidget: AppBar(
        title: Text('Text'),
      ),
      bottomBarWidget: Container(
        height: 100,
        color: Colors.red,
      ),
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.main);
        },
      ),
      builder: (BuildContext context, PageData<MainPageVM> pageData, Widget child) {
        return Container(
          child: child,
        );
      },
    );
  }
}