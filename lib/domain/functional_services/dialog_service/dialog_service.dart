import 'package:foodie_car_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

/// [DialogService] it is service for control dialogs.
/// This class it - Singleton, for function using use [DialogService.instance]
/// - For show dialog use method [show] in [DialogService].
/// You need send to this function a class extended from [IDialog].
/// - For close dialog you can use [close] method.
/// - For checking is dialog opened you can use [_isDisplayed] boolean param.
class DialogService {
  static const tag = '[DialogService]';

  DialogService._privateConstructor();

  static final DialogService _instance = DialogService._privateConstructor();

  static DialogService get instance => _instance;

  /// This variable helps us track the state of dialogs.
  bool _isDisplayed = false;

  bool get isDisplayed => _isDisplayed;

  /// This function starts the process of opening a dialog window.
  /// [dialog] param will take a class object extended from [IDialog] interface.
  Future<void> show(IDialog dialog) async => await dialog.show(_display);

  /// This function will close opened dialog if [_isDisplayed] is true.
  /// And will show message to console if [_isDisplayed] is false.
  void close() {
    if (!_isDisplayed) {
      print('$tag => <closeDialog> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be removed.');
      return;
    }

    if (NavigatorHolder.navigatorKey.currentState.canPop()) {
      NavigatorHolder.navigatorKey.currentState.pop();
      _isDisplayed = false;
    }
  }

  /// This function will start builder of [IDialog] object and will track the dialog state.
  /// if [_isDisplayed] is true - you will see in console a error message. (Dialog not be showed).
  /// if [_isDisplayed] is false - you will see on the screen a new dialog
  Future<void> _display(BuilderFunction builder) async {
    print('Is displayed $_isDisplayed');
    if (_isDisplayed) {
      print('$tag => <_display> => Error Message: _isDisplayed: $_isDisplayed, Dialog cant be showed.');
      return;
    }

    _isDisplayed = true;

    final BuildContext ctx = NavigatorHolder.navigatorKey.currentState.overlay.context;

    await builder(ctx).then((_) {
      FocusScope.of(ctx).unfocus();
      _isDisplayed = false;
    });
  }
}
