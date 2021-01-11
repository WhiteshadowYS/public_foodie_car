import 'package:foodie_client_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/shared/dialog_builders.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/widgets/image_dialog_widget.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/widgets/test_dialog.dart';
import 'package:flutter/material.dart';

class ImageDialog implements IDialog {
  final ImageProvider imageProvider;

  const ImageDialog({
    this.imageProvider,
  });

  Widget get widget => ImageDialogWidget(
        key: Key('ImageDialogWidget'),
        data: this,
      );

  Future<void> _builder(BuildContext context) async {
    return DialogBuilders.defaultDialogBuilder(
      widget: widget,
      context: context,
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}
