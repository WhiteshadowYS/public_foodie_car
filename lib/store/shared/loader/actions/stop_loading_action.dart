import 'package:flutter/material.dart';
import 'package:foody_client_template/store/shared/base_action.dart';
import 'package:foody_client_template/store/shared/loader/loader_state.dart';

class StopLoadingAction extends BaseAction {
  final LoaderKey loaderKey;

  StopLoadingAction({
    @required this.loaderKey,
  }) : super(type: 'StopLoadingAction');
}
