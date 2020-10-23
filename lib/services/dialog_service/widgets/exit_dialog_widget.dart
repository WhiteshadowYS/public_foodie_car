import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_catalog/dictionary/dictionary_classes/popup_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/dialog_layout.dart';
import 'package:my_catalog/services/dialog_service/models/exit_dialog.dart';
import 'package:my_catalog/services/dialog_service/widgets/dialog_main_button.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class ExitDialogWidget extends StatelessWidget {
  final ExitDialog dialogModel;

  ExitDialogWidget(this.dialogModel) : super(key: Key('ExitDialogWidget'));

  @override
  Widget build(BuildContext context) {
    final PopUpDictionary dictionary = FlutterDictionary.instance.language.popUpDictionary;
    return DialogLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => DialogService.instance.close(),
                child: SVGImages().close(),
              ),
            ),
            SizedBox(
              height: 50.0,
              child: SVGImages().mcLogo(),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                dictionary.exitText,
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.titleTextStyle(size: 22.0),
              ),
            ),
            DialogMainButton(
              keyValue: DialogKeys.exitDialogYesButton,
              backgroundColor: CustomTheme.colors.primaryColor,
              textColor: CustomTheme.colors.background,
              title: dictionary.yes,
              onTap: () => SystemNavigator.pop(),
            ),
            SizedBox(
              height: 16.0,
            ),
            DialogMainButton(
              keyValue: DialogKeys.exitDialogNoButton,
              backgroundColor: CustomTheme.colors.background,
              textColor: CustomTheme.colors.primaryColor,
              title: dictionary.no,
              onTap: () => DialogService.instance.close(),
            ),
          ],
        ),
      ),
    );
  }
}
