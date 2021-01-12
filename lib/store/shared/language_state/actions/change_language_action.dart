import 'package:foodie_client_template/store/shared/base_action.dart';

abstract class ChangeLanguageAction extends BaseAction {
  final String locale;
  ChangeLanguageAction({
    this.locale,
  }) : super(type: 'ChangeLanguageAction');
}
