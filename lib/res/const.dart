import 'package:logger/logger.dart';

final Logger logger = Logger();

const Duration MILLISECONDS_300 = Duration(milliseconds: 300);
const Duration MILLISECONDS_900 = Duration(milliseconds: 900);

const String TITLE = 'My catalog';

//region [PLACEHOLDER TEXT]
const String PLACEHOLDER_TEXT = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
//endregion

const bool DESIGN_SCREEN_ALLOW_FONT_SCALING = true;
const double DESIGN_SCREEN_HEIGHT = 812.0;
const double DESIGN_SCREEN_WIDTH = 375.0;

class ResponseKeys {
  static const String data = 'data';
}

class PageTypes {
  static const String HOME_TYPE = 'HOME';
  static const String SETTINGS_TYPE = 'SETTINGS';
  static const String SWITCH_TYPE = 'SWITCH';
  static const String LOGOUT_TYPE = 'LOGOUT';
}