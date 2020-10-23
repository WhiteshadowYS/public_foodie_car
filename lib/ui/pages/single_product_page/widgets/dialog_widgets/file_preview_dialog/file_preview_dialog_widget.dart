import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/dialog_layout.dart';
import 'package:my_catalog/services/dialog_service/widgets/dialog_close_button.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/dialog_widgets/file_preview_dialog/file_preview_dialog.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/dialog_widgets/file_preview_dialog/file_preview_dialog_widget_vm.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/dialog_widgets/image_preview_widget.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/dialog_widgets/pdf_preview_widget.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/dialog_widgets/video_preview_widget.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/file_preview_bottom_block.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class FilePreviewDialogWidget extends StatelessWidget {
  final FilePreviewDialog dialogModel;

  FilePreviewDialogWidget(this.dialogModel) : super(key: Key('FilePreviewDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FilePreviewDialogWidgetVM>(
      converter: FilePreviewDialogWidgetVM.fromStore,
      builder: (BuildContext context, FilePreviewDialogWidgetVM vm) {
        return DialogLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                alignment: Alignment.topRight,
                child: DialogCloseButton(
                  keyValue: DialogKeys.closeFilePreviewDialogButton,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 23.0),
                child: _getPreviewFileWidget(dialogModel.file.type, dialogModel.file.file),
              ),
              FilePreviewBottomBlock(
                itemName: dialogModel.file.languages[vm.currentLocale][KEY_NAME],
                fileUrl: dialogModel.file.file,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _getPreviewFileWidget(String type, String url) {
    switch (type) {
      case FileTypes.IMAGE_TYPE:
        return ImagePreviewWidget(imageUrl: url);
      case FileTypes.VIDEO_TYPE:
        return VideoPreviewWidget(videoUrl: url);
      case FileTypes.PDF_TYPE:
        return PdfPreviewWidget(pdfUrl: url);
      default:
        return SizedBox();
    }
  }
}
