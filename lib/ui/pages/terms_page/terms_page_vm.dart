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
  final String selectedLocale;
  final String Function(String) titleText;
  final String Function(String) buttonText;
  final String Function(String) backButtonText;

  const TermsPageVM({
    @required this.selectedLocale,
    @required this.titleText,
    @required this.termsText,
    @required this.buttonText,
    @required this.backButtonText,
    @required this.acceptTermsAndNavigate,
    @required this.back,
  });

  static TermsPageVM fromStore(Store<AppState> store) {
    return TermsPageVM(
      back: RouteSelectors.doPop(store),
      acceptTermsAndNavigate: StorageSelector.getAcceptTermsAndNavigateFunction(store),
      termsText: StorageSelector.getTermsText(store),
      titleText: StorageSelector.getTermsTitleText(store),
      buttonText: StorageSelector.getTermsButtonText(store),
      backButtonText: StorageSelector.getBackButtonText(store),
      selectedLocale: StorageSelector.getSelectedLocale(store),
    );
  }
}
