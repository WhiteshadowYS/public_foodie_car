import 'package:foodie_car_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/shared/dialog_builders.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/widgets/map_dialog_widget.dart';

class MapDialog implements IDialog {
  final String address;

  const MapDialog({
    this.address,
  });

  Widget get widget => MapDialogWidget(
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
