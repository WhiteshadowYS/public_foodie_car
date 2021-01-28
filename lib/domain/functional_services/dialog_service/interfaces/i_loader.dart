import 'package:foodie_car_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:foodie_car_template/store/shared/loader/loader_state.dart';
import 'package:flutter/material.dart';

class ILoader extends IDialog {
  final bool state;
  final String title;
  final LoaderKey loaderKey;

  ILoader({
    @required this.state,
    @required this.loaderKey,
    @required this.title,
  });

  Widget get widget {
    return Container();
  }

  @override
  Future<void> show(DisplayFunction displayFunction) async {}
}
