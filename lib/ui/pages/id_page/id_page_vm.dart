import 'package:base_project_template/models/pages/interfaces/i_page_data.dart';
import 'package:base_project_template/models/pages/models/id_page_data.dart';
import 'package:base_project_template/store/shared/route_selectors.dart';
import 'package:flutter/material.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:base_project_template/store/shared/dialog_state/dialog_selector.dart';
import 'package:redux/redux.dart';

///[MainPageVM] view model for MainPage
///[exitDialog] - void function for getting exit dialog function
class IdPageVM {
  final void Function() exitDialog;
  final void Function(IPageData, String) route;

  IdPageVM({
    @required this.route,
    @required this.exitDialog,
  });

  static IdPageVM fromStore(Store<AppState> store) {
    return IdPageVM(
      /// Another
      route: RouteSelectors.getPushToWithArgumentsFunction(store),
      exitDialog: DialogSelectors.getExitDialogFunction(store),
    );
  }
}
