import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class OpenStoreResultAction extends BaseAction {
  final bool isFirstOpen;

  OpenStoreResultAction({
    @required this.isFirstOpen,
  }) : super(type: 'OpenStoreResultAction');
}
