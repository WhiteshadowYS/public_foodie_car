import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:pictures_view/dialogs/interfaces/i_dialog.dart';
import 'package:pictures_view/dialogs/shared/dialog_builders.dart';
import 'package:pictures_view/res/const.dart';

class DialogService {
  static const tag = '[DialogService]';

  DialogService._privateConstructor();

  static final DialogService _instance = DialogService._privateConstructor();

  static DialogService get instance => _instance;

  bool _isDisplayed = false;

  bool get isDisplayed => _isDisplayed;

  void show(IDialog dialog) => dialog.show(_display);

  void closeDialog() {
    if (!_isDisplayed) {
      logger.e('$tag => <closeDialog> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be removed.');
      return;
    }

    if (NavigatorHolder.navigatorKey.currentState.canPop()) {
      NavigatorHolder.navigatorKey.currentState.pop();
      _isDisplayed = false;
    }
  }

  void _display(BuilderFunction builder) {
    if (_isDisplayed) {
      logger.e('$tag => <_display> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be showed.');
      return;
    }

    _isDisplayed = true;

    final BuildContext ctx = NavigatorHolder.navigatorKey.currentState.overlay.context;

    builder(ctx).then((_) {
      FocusScope.of(ctx).unfocus();
      _isDisplayed = false;
    });
  }
}
