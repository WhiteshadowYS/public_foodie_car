import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:base_project_template/theme/custom_theme.dart';
import 'package:base_project_template/res/app_styles/app_colors.dart';
import 'package:base_project_template/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_layout.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_close_button.dart';


class ErrorDialogWidget extends StatelessWidget {
  final ErrorDialog dialogModel;

  ErrorDialogWidget(this.dialogModel) : super(key: Key('ErrorDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: 60.sp,
                ),
                Spacer(),
                Icon(
                  Icons.warning,
                  color: AppColors.kRed,
                  size: 40.sp,
                ),
                Spacer(),
                Container(
                  width: 60.sp,
                  height: 40.sp,
                  //alignment: directionality == TextDirection.rtl ? Alignment.topLeft : Alignment.topRight,
                  alignment: Alignment.topRight,
                  child: DialogCloseButton(
                    keyValue: '123',
                  ),
                ),
              ],
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
