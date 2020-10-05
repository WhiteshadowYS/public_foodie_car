import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/services/dialog_service/shared/dialog_builders.dart';
import 'package:my_catalog/services/dialog_service/widgets/error_dialog_widget.dart';
import 'package:my_catalog/services/dialog_service/widgets/notification_dialog_widget.dart';

/// [ErrorDialog] realisation for [IDialog] interface. This [dialog] was using for show all errors in the application.
/// Params:
///   - [title] - Title of dialog.
///   - [message] - Main message(content) of dialog.
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class NotificationDialog implements IDialog {
  final String title;
  final String message;
  final String logoUrl;

  NotificationDialog({
    @required this.message,
    this.title = 'Notification',
    this.logoUrl,
  }) : assert(message != null, throw ('Message should be not null'));

  /// [ErrorDialogWidget] it is widget for this dialog. What will accept a dialog object.
  Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: NotificationDialogWidget(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}