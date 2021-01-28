import 'package:flutter/material.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/shared/dialog_builders.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/widgets/image_dialog_widget.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/widgets/phone_dialog_widget.dart';

class PhoneDialog implements IDialog {
  final String phone;

  const PhoneDialog({
    this.phone,
  });

  Widget get widget => PhoneDialogWidget(
        data: this,
      );

  Future<void> _builder(BuildContext context) async {
    return await DialogBuilders.defaultDialogBuilder(
      widget: widget,
      context: context,
    );
  }

  @override
  Future<void> show(DisplayFunction display) async => display(_builder);
}
