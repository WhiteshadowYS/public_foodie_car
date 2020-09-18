import 'package:flutter/material.dart';
import 'package:pictures_view/services/focus_service.dart';
import 'package:pictures_view/ui/layouts/main_layout/main_layout.dart';
import 'package:pictures_view/widgets/dialog/dialog.dart';

import '../../../widgets/text_field.dart';

class NextButtonPage extends StatefulWidget {
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
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
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
      ),
    );
  }
}