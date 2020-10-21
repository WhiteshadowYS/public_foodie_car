import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/dictionary_classes/popup_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/services/dialog_service/models/dialog_layout.dart';
import 'package:my_catalog/services/dialog_service/models/internet_connection_dialog.dart';
import 'package:my_catalog/services/dialog_service/widgets/dialog_main_button.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class InternetConnectionWidget extends StatelessWidget {
  final InternetConnection dialogModel;

  InternetConnectionWidget(this.dialogModel) : super(key: Key('InternetConnectionWidget'));

  @override
  Widget build(BuildContext context) {
    final PopUpDictionary dictionary = FlutterDictionary.instance.language.popUpDictionary;
    return DialogLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.signal_cellular_connected_no_internet_4_bar,
              size: 40,
              color: CustomTheme.colors.primaryColor,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                dictionary.noInternet,
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.titleTextStyle(size: 22.0),
              ),
            ),
            DialogMainButton(
              keyValue: DialogKeys.exitDialogYesButton,
              backgroundColor: CustomTheme.colors.primaryColor,
              textColor: CustomTheme.colors.background,
              title: dictionary.okay,
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
