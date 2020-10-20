import 'package:flutter/cupertino.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class TermsPageVM {
  final void Function() acceptTermsAndNavigate;
  final void Function() back;
  final String termsText;
  final bool isCheckBoxNeeded;

  const TermsPageVM({
    @required this.acceptTermsAndNavigate,
    @required this.back,
    @required this.termsText,
    @required this.isCheckBoxNeeded,
  });

  static TermsPageVM fromStore(Store<AppState> store) {
    return TermsPageVM(
      acceptTermsAndNavigate: StorageSelector.getAcceptTermsAndNavigateFunction(store),
      back: RouteSelectors.doPop(store),
      termsText: StorageSelector.getTermsText(store),
      isCheckBoxNeeded: true,
    );
  }
}
