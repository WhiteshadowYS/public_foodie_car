import 'package:flutter/material.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_layout.dart';
import 'package:base_project_template/services/dialog_service/dialogs/internet_connection_dialog/internet_connection_dialog.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_main_button.dart';
import 'package:base_project_template/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternetConnectionDialogWidget extends StatelessWidget {
  final InternetConnectionDialog dialogModel;

  InternetConnectionDialogWidget(this.dialogModel) : super(key: Key('InternetConnectionDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.signal_cellular_connected_no_internet_4_bar,
              size: 40.sp,
              color: CustomTheme.colors.primaryColor,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'No internet',
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.titleTextStyle(size: 22.sp),
              ),
            ),
            DialogMainButton(
              keyValue: '1234567',
              backgroundColor: CustomTheme.colors.primaryColor,
              textColor: CustomTheme.colors.background,
              title: 'Ok',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
