import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/file_preview_bottom_block.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/file_preview_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/image_preview_widget.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/video_preview_widget.dart';
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
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => DialogService.instance.close(),
                  child: SVGImages().close(),
                ),
              ),
              _getPreviewFileWidget(dialogModel.file.type, dialogModel.file.fileUrl),
              FilePreviewBottomBlock(
                  itemName: dialogModel.file.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()][NAME]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPreviewFileWidget(String type, String url) {
    switch (type) {
      case FileTypes.IMAGE_TYPE:
        return ImagePreviewWidget(imageUrl: url);
      case FileTypes.VIDEO_TYPE:
        return VideoPreviewWidget(videoUrl: url);
      case FileTypes.PDF_TYPE:
        return Placeholder(
          fallbackHeight: 200,
          color: Colors.green,
        );
    }
  }
}
