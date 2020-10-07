import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/loadier_dialog.dart';
import 'package:my_catalog/services/dialog_service/models/notification_dialog.dart';
import 'package:my_catalog/services/dialog_service/widgets/loader_dialog_widget.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';

class MainPage extends StatelessWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageVM>(
      converter: MainPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          appBar: MainAppBar(
            key: 'MainAppBar',
            //logoUrl: 'https://cdn.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg',
            title: 'T E S L A',
            backOnTap: () {},
          ),
          bottomBar: BottomBar(
            key: 'BottomBar',
          ),
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
              RaisedButton(
                child: Text('Show loader'),
                onPressed: () {
                  vm.showLoader();
                  Future.delayed(Duration(seconds: 3)).then((value) => vm.stopDialog());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
