import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_loader.dart';
import 'package:my_catalog/services/dialog_service/shared/dialog_builders.dart';
import 'package:my_catalog/services/dialog_service/widgets/loader_dialog_widget.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';

/// [EmptyLoaderDialog] realisation for [IDialog] interface. This [dialog] was using for show loader in the application.
/// Methods:
///   - [_builder] - Private constructor for Dialog. Will use [DialogBuilders.defaultDialogBuilder] for show dialog.
///   - [show] - @override function from [IDialog]. Will using for show dialog. Single [public] function.
class EmptyLoaderDialog implements ILoader {
  @override
  final bool state;

  @override
  final LoaderKey loaderKey;

  @override
  final String title;

  EmptyLoaderDialog({
    @required this.state,
    @required this.loaderKey,
    this.title,
  });

  @override
  Widget get widget => Container();

  Future<void> _builder(BuildContext context) async {
    return DialogBuilders.defaultDialogBuilder(
      widget: widget,
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}
