import 'package:foodie_car_template/domain/functional_services/dialog_service/interfaces/i_loader.dart';
import 'package:flutter/material.dart';
import 'package:foodie_car_template/store/shared/base_action.dart';

class StartLoadingAction extends BaseAction {
  final ILoader loader;

  StartLoadingAction({
    @required this.loader,
  }) : super(type: 'StartLoadingAction');
}
