import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveCafeForCity extends BaseAction {
  final List<Cafe> cafeList;
  SaveCafeForCity({
    @required this.cafeList,
  }) : super(type: 'SaveCafeForCity');
}
