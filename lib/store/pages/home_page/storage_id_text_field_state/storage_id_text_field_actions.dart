import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class SaveIdCatalogAction extends BaseAction {
  final String id;

  SaveIdCatalogAction({
    @required this.id,
  }) : super(type: 'SaveIdCatalogAction');
}
