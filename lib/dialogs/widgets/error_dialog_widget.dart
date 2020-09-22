import 'package:flutter/material.dart';
import 'package:pictures_view/dialogs/models/error_dialog.dart';
import 'package:pictures_view/services/dialog_service.dart';

class ErrorDialogWidget extends StatelessWidget {
  final ErrorDialog dialogModel;

  ErrorDialogWidget(this.dialogModel) : super(key: Key('ErrorDialogWidget'));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: RaisedButton(
            onPressed: () {
              DialogService.instance.closeDialog();
            },
          ),
        ),
      ),
    );
  }
}
