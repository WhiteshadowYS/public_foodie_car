import 'package:flutter/material.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/services/dialog_service/shared/dialog_builders.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/dialog_widgets/file_preview_dialog_widget.dart';

/// [FilePreviewDialog] realisation for [IDialog] interface. This [dialog] is using for show video, image, or pdf files.
/// Params:
///   - [file] - file model with all info (type, file, name ).
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class FilePreviewDialog implements IDialog {
  final DummyFile file;

  FilePreviewDialog({
    @required this.file,
  }) : assert(file != null, throw ('file should be not null'));

  /// [ErrorDialogWidget] it is widget for this dialog. What will accept a dialog object.
  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: FilePreviewDialogWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}