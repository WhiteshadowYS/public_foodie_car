import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/services/dialog_service/shared/dialog_builders.dart';
import 'package:my_catalog/services/dialog_service/widgets/exit_dialog_widget.dart';

/// [ExitDialog] realisation for [IDialog] interface. This [dialog] was using for show to confirm exit from application.
/// Params:
///   - [logoUrl] - Image with logo
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class ExitDialog implements IDialog {

  final String logoUrl;

  ExitDialog({
    this.logoUrl,
  });

  /// [ExitDialog] it is widget for this dialog. What will accept a dialog object.
  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: ExitDialogWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}