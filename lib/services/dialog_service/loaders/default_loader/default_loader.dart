import 'package:flutter/material.dart';
import 'package:base_project_template/services/dialog_service/shared/i_dialog.dart';
import 'package:base_project_template/services/dialog_service/shared/i_loader.dart';
import 'package:base_project_template/services/dialog_service/shared/dialog_builders.dart';
import 'package:base_project_template/services/dialog_service/loaders/default_loader/loader_dialog_widget.dart';
import 'package:base_project_template/store/shared/loader/loader_state.dart';

/// [LoaderDialog] realisation for [IDialog] interface. This [dialog] was using for show loader in the application.
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class DefaultLoaderDialog implements ILoader {
  @override
  final bool state;

  @override
  final LoaderKey loaderKey;

  @override
  final String title;

  DefaultLoaderDialog({
    @required this.state,
    @required this.loaderKey,
    this.title,
  });

  @override
  Widget get widget => LoaderDialogWidget(this);

  Future<void> _builder(BuildContext context) async {
    return DialogBuilders.defaultDialogBuilder(
      widget: widget,
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}
