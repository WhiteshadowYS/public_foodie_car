import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/models/dialog_layout.dart';
import 'package:my_catalog/services/dialog_service/models/exit_dialog.dart';

class ExitDialogWidget extends StatelessWidget {
  final ExitDialog dialogModel;

  ExitDialogWidget(this.dialogModel) : super(key: Key('ExitDialogWidget'));
  @override
  Widget build(BuildContext context) {
    return DialogLayout(child: Container(),);
  }
}
