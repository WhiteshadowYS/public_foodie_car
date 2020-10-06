import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/widgets/main_list_view.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/notification_dialog.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';



class MainPage extends StatelessWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, MainPageVM vm) {
        return MainLayout(
          bgColor: CustomTheme.colors.primaryColor,
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              MainListView(
                height: 200.h,
                itemHeight: 60.0,
                itemCount: vm.catalogs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(vm.catalogs[index].id.toString()),
                  );
                },
              ),
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
              const SizedBox(height: 24.0),
              RaisedButton(
                child: Text('Get Storage Data'),
                onPressed: () => DialogService.instance.show(
                  NotificationDialog(
                    title: 'Eternal',
                    message:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
