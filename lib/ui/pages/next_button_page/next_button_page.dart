import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pictures_view/services/focus_service.dart';
import 'package:pictures_view/store/application/app_state.dart';
import 'package:pictures_view/ui/layouts/main_layout/main_layout.dart';
import 'package:pictures_view/widgets/next_button_dropdown.dart';

import '../../../widgets/next_button_text_field.dart';
import 'next_button_page_viewmodel.dart';

class NextButtonPage extends StatefulWidget {
  NextButtonPage() : super(key: Key('NextButtonPage'));

  @override
  _NextButtonPageState createState() => _NextButtonPageState();
}

class _NextButtonPageState extends State<NextButtonPage> {
  FocusService focusService = FocusService();

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

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
      FocusKey(
        value: '4',
        order: 4,
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
                const SizedBox(height: 20.0),
                NextButtonTextField(
                  focusKeyValue: '1',
                  focusService: focusService,
                  controller: controller1,
                ),
                const SizedBox(height: 20.0),
                NextButtonDropdown(
                  focusKeyValue: '2',
                  focusService: focusService,

                  title: 'Titles',
                  printedParam: '1',
                  list: [
                    {'1': 'Test 1'},
                    {'1': 'Test 2'},
                    {'1': 'Test 3'},
                    {'1': 'Test 4'},
                    {'1': 'Test 5'},
                  ],
                  onSelectItem: (dynamic value) {},
                  showDropdown: vm.showDropdownDialog,
                ),
                const SizedBox(height: 20.0),
                NextButtonTextField(
                  focusKeyValue: '3',
                  focusService: focusService,
                  controller: controller2,
                ),
                const SizedBox(height: 20.0),
                NextButtonTextField(
                  focusKeyValue: '4',
                  focusService: focusService,
                  controller: controller3,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
