import 'package:base_project_template/services/route_service/models/routes.dart';
import 'package:base_project_template/theme/custom_theme.dart';
import 'package:base_project_template/ui/layouts/main_layout/main_layout.dart';
import 'package:base_project_template/ui/pages/main_page/main_page_vm.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    CustomTheme.instance.setDefaultTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout<MainPageVM>(
      key: Key('MainPageKey'),
      converter: MainPageVM.fromStore,
      appBarWidget: AppBar(
        title: Text('Text'),
      ),
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.idPage);
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
