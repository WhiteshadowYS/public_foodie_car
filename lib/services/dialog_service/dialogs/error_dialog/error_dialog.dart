import 'package:flutter/material.dart';
import 'package:base_project_template/res/const.dart';
import 'package:base_project_template/services/dialog_service/shared/i_dialog.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_builders.dart';
import 'package:base_project_template/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';

/// [ErrorDialog] realisation for [IDialog] interface. This [dialog] was using for show all errors in the application.
/// Params:
///   - [title] - Title of dialog.
///   - [message] - Main message(content) of dialog.
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class ErrorDialog implements IDialog {
  final String title;
  final String message;

  ErrorDialog({
    @required this.message,
    this.title = ERROR,
  }) : assert(message != null, throw ('Message should be not null'));

  /// [ErrorDialogWidget] it is widget for this dialog. What will accept a dialog object.
  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: ErrorDialogWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}