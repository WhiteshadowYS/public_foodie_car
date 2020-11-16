import 'package:base_project_template/res/app_styles/app_colors.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:base_project_template/theme/custom_theme.dart';
import 'package:base_project_template/ui/layouts/main_layout/main_layout.dart';
import 'package:base_project_template/ui/pages/main_page/main_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, MainPageVM vm) {
        return MainLayout(
          bgColor: AppColors.kWhite,
          resizeToAvoidBottomPadding: true,
          canExit: true,
          back: () => vm.exitDialog(),
          child: Container(),
        );
      },
    );
  }
}
