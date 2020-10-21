import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class SetOpenedStoreIdAction extends BaseAction {
  final int id;

  SetOpenedStoreIdAction({
    @required this.id,
  }) : super(type: 'SetOpenedStoreIdAction');
}

class SetOpenedCatalogIdAction extends BaseAction {
  final int id;

  SetOpenedCatalogIdAction({
    @required this.id,
  }) : super(type: 'SetOpenedCatalogIdAction');
}

class SetOpenedCategoryIdAction extends BaseAction {
  final int id;

  SetOpenedCategoryIdAction({
    @required this.id,
  }) : super(type: 'SetOpenedCategoryIdAction');
}

class SetOpenedSubCategoryIdAction extends BaseAction {
  final int id;

  SetOpenedSubCategoryIdAction({
    @required this.id,
  }) : super(type: 'SetOpenedSubCategoryIdAction');
}

class SetOpenedProductIdAction extends BaseAction {
  final int id;

  SetOpenedProductIdAction({
    @required this.id,
  }) : super(type: 'SetOpenedProductIdAction');
}
