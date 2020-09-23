import 'package:flutter/material.dart';
import 'package:pictures_view/services/dialog_service/interfaces/i_dialog.dart';
import 'package:pictures_view/services/dialog_service/shared/dialog_builders.dart';
import 'package:pictures_view/services/dialog_service/widgets/dropdown_dialog_widget.dart';

class DropdownDialog implements IDialog {
  final List<Map<String, dynamic>> list;
  final String printedParam;
  final String title;
  final void Function(bool) whenSheetDispose;
  final void Function(int) onItemSelected;

  DropdownDialog({
    this.title,
    this.list,
    this.onItemSelected,
    this.printedParam,
    this.whenSheetDispose,
  });

   Future<void> _builder(BuildContext context) {
    return DialogBuilders.modalBottomSheetBuilder(
      context: context,
      widget: ClientDropdown(this),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}