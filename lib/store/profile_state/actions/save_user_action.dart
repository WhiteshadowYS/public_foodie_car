import 'package:flutter/material.dart';
import 'package:foodie_client_template/domain/entity/user/user.dart';
import 'package:foodie_client_template/store/shared/base_action.dart';

class SaveUserAction extends BaseAction {
  final User user;
  SaveUserAction({
    @required this.user,
  }) : super(type: 'SaveUserAction');
}
