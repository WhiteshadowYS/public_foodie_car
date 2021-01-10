import 'package:foody_client_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:foody_client_template/store/shared/loader/loader_state.dart';
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
  void show(DisplayFunction displayFunction) {}
}
