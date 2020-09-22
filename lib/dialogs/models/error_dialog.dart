import 'package:flutter/material.dart';
import 'package:pictures_view/dialogs/interfaces/i_dialog.dart';
import 'package:pictures_view/dialogs/shared/dialog_builders.dart';
import 'package:pictures_view/dialogs/widgets/error_dialog_widget.dart';

class ErrorDialog implements IDialog {
  final String title;
  final String message;

  ErrorDialog({
    @required this.message,
    this.title = 'Error',
  }) : assert(message != null, throw ('Message should be not null'));

  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: ErrorDialogWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}
