import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SelectCafeAction extends BaseAction {
  final Cafe cafe;

  SelectCafeAction({
    @required this.cafe,
  }) : super(type: 'SelectCafeAction');
}
