import 'package:flutter/material.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class SplashScreenVM {
  final void Function() internetDialog;

  SplashScreenVM({
    @required this.internetDialog,
  });

  static SplashScreenVM fromStore(Store<AppState> store) {
    return SplashScreenVM(
      internetDialog: DialogSelectors.getInternetConnectionDialogFunction(store),
    );
  }
}
