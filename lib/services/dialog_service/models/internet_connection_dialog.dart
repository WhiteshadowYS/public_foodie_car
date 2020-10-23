import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/services/dialog_service/shared/dialog_builders.dart';
import 'package:my_catalog/services/dialog_service/widgets/error_dialog_widget.dart';
import 'package:my_catalog/services/dialog_service/widgets/interner_connection_widget.dart';

/// [InternetConnection] realisation for [IDialog] interface. This [dialog] was using for show no internet connection in the application.
/// Params:
///   - [title] - Title of dialog.
///   - [message] - Main message(content) of dialog.
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class InternetConnection implements IDialog {
  /// [ErrorDialogWidget] it is widget for this dialog. What will accept a dialog object.
  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: InternetConnectionWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}