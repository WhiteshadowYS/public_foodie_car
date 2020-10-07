import 'package:flutter/material.dart';
import 'package:my_catalog/res/app_styles/app_colors.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class ErrorDialogWidget extends StatelessWidget {
  final ErrorDialog dialogModel;

  ErrorDialogWidget(this.dialogModel) : super(key: Key('ErrorDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(20.0),
          constraints: BoxConstraints(
            maxHeight: 600.h,
            minHeight: 300.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: CustomTheme.colors.background,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => DialogService.instance.close(),
                  child: SVGImages().close(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Spacer(),
                  Icon(
                    Icons.warning,
                    color: AppColors.kRed,
                    size: 50.0,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  dialogModel.title,
                  textAlign: TextAlign.center,
                  style: CustomTheme.textStyles.titleTextStyle(size: 22.0),
                ),
              ),
              Text(
                dialogModel.message,
                textAlign: TextAlign.center,
                style: CustomTheme.textStyles.mainTextStyle(size: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
