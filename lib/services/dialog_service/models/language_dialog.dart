import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/services/dialog_service/shared/dialog_builders.dart';
import 'package:my_catalog/services/dialog_service/widgets/language_dialog_widget.dart';

class LanguageDialog implements IDialog {
  final List<LanguageModel> list;
  final String selectedLanguage;
  final void Function(String) onItemSelected;

  LanguageDialog({
    this.selectedLanguage,
    this.list,
    this.onItemSelected,
  });

   Future<void> _builder(BuildContext context) {
    return DialogBuilders.defaultDialogBuilder(
      context: context,
      widget: LanguageDialogWidget(
        key: 'LanguageDialogWidget',
        dialog: this,
      ),
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}