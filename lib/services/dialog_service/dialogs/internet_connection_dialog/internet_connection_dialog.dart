import 'package:flutter/material.dart';
import 'package:base_project_template/services/dialog_service/shared/i_dialog.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_builders.dart';
import 'package:base_project_template/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:base_project_template/services/dialog_service/dialogs/internet_connection_dialog/interner_connection_dialog_widget.dart';

/// [InternetConnectionDialog] realisation for [IDialog] interface. This [dialog] was using for show no internet connection in the application.
/// Params:
///   - [title] - Title of dialog.
///   - [message] - Main message(content) of dialog.
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class InternetConnectionDialog implements IDialog {
  /// [ErrorDialogWidget] it is widget for this dialog. What will accept a dialog object.
  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: InternetConnectionDialogWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}