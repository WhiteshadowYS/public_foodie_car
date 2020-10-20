import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/services/dialog_service/shared/dialog_builders.dart';
import 'package:my_catalog/services/dialog_service/widgets/image_view_dialog_widget.dart';

class ImageViewDialog implements IDialog {
  final List<dynamic> gallery;
  final int currentIndex;

  ImageViewDialog({
    this.gallery,
    this.currentIndex,
  });

  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: ImageViewDialogWidget(
        key: 'ImageViewDialogWidget',
        dialog: this,
      ),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}