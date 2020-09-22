import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pictures_view/services/focus_service.dart';
import 'package:pictures_view/store/application/app_state.dart';
import 'package:pictures_view/ui/layouts/main_layout/main_layout.dart';

import '../../../widgets/text_field.dart';
import 'next_button_page_viewmodel.dart';

class NextButtonPage extends StatefulWidget {
  NextButtonPage() : super(key: Key('NextButtonPage'));

  @override
  _NextButtonPageState createState() => _NextButtonPageState();
}

class _NextButtonPageState extends State<NextButtonPage> {
  FocusService focusService = FocusService();

  @override
  void initState() {
    focusService.addAllKeys([
      FocusKey(
        value: '1',
        order: 1,
      ),
      FocusKey(
        value: '2',
        order: 2,
      ),
      FocusKey(
        value: '3',
        order: 3,
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: AppBar(),
      child: StoreConnector<AppState, NextButtonPageViewModel>(
        converter: NextButtonPageViewModel.fromStore,
        builder: (BuildContext context, NextButtonPageViewModel vm) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    vm.showErrorDialog('Text');
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    vm.closeDialog();
                  },
                ),
                const SizedBox(height: 20.0),
                NextButtonTextField(
                  focusKeyValue: '1',
                  focusService: focusService,
                ),
                const SizedBox(height: 20.0),
                NextButtonTextField(
                  focusKeyValue: '2',
                  focusService: focusService,
                ),
                const SizedBox(height: 20.0),
                NextButtonTextField(
                  focusKeyValue: '3',
                  focusService: focusService,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
