import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/shared/dialog_builders.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/widgets/choose_city_dialog_widget.dart';

class ChooseCityDialog implements IDialog {
  final List<City> locations;
  final void Function(City) selectCity;

  const ChooseCityDialog({
    this.locations,
    this.selectCity,
  });

  Widget get widget => ChooseCityDialogWidget(this);

  Future<void> _builder(BuildContext context) async {
    return await DialogBuilders.defaultDialogBuilder(
      widget: widget,
      context: context,
    );
  }

  @override
  Future<void> show(DisplayFunction display) async => await display(_builder);
}
