import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/file_preview_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class FilePreviewDialogWidget extends StatelessWidget {
  final FilePreviewDialog dialogModel;

  FilePreviewDialogWidget(this.dialogModel) : super(key: Key('FilePreviewDialogWidget'));

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
            minHeight: 450.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: CustomTheme.colors.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => DialogService.instance.close(),
                  child: SVGImages().close(),
                ),
              ),
              Placeholder(
                fallbackHeight: 200,
              ),
              // TODO(Daniil): Move to separate widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dialogModel.file.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()][NAME],
                    style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    color: CustomTheme.colors.primaryColor,
                    iconSize: 35,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
