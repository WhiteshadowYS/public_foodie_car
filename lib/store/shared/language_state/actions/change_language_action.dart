import 'package:foodie_client_template/store/shared/base_action.dart';

class ChangeLanguageAction extends BaseAction {
  final String locale;
  ChangeLanguageAction({
    this.locale,
  }) : super(type: 'ChangeLanguageAction');
}