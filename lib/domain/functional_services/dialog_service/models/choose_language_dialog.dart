import 'package:foody_client_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:foody_client_template/domain/functional_services/dialog_service/shared/dialog_builders.dart';
import 'package:foody_client_template/domain/functional_services/dialog_service/widgets/choose_language_dialog_widget.dart';
import 'package:flutter/material.dart';

class ChooseLanguageDialog implements IDialog {
  final void Function(String) selectLanguage;

  const ChooseLanguageDialog({
    this.selectLanguage,
  });

  Widget get widget => ChooseLanguageDialogWidget(this);

  Future<void> _builder(BuildContext context) async {
    return DialogBuilders.defaultDialogBuilder(
      widget: widget,
      context: context,
    );
  }

  @override
  void show(DisplayFunction display) => display(_builder);
}
