import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/services/dialog_service/models/dialog_layout.dart';
import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
import 'package:my_catalog/services/dialog_service/widgets/dialog_close_button.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class ErrorDialogWidget extends StatelessWidget {
  final ErrorDialog dialogModel;

  ErrorDialogWidget(this.dialogModel) : super(key: Key('ErrorDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: DialogCloseButton(keyValue: DialogKeys.closeErrorDialogButton),
            ),
            Icon(
              Icons.warning,
              color: AppColors.kRed,
              size: 40.sp,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                dialogModel.title,
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.titleTextStyle(size: 18.sp),
              ),
            ),
            Text(
              dialogModel.message,
              textAlign: TextAlign.center,
              style: CustomTheme.textStyles.mainTextStyle(size: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
