import 'package:flutter/cupertino.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SingleProductPageVM {
  final void Function() navigateToSettingsPage;
  final void Function(DummyFile file) filePreview;

  const SingleProductPageVM({
    @required this.navigateToSettingsPage,
    @required this.filePreview,
  });

  static SingleProductPageVM fromStore(Store<AppState> store) {
    return SingleProductPageVM(
        navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
        filePreview: DialogSelectors.getShowFilePreviewDialogFunction(store));
  }
}
