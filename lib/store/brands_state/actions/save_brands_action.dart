import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/brand/brand.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveBrandsAction extends BaseAction {
  final List<Brand> brands;

  SaveBrandsAction({@required this.brands}) : super(type: 'SaveBrandsAction');
}
