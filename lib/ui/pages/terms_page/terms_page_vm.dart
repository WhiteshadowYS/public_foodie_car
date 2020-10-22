import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class TermsPageVM {
  final String termsText;
  final String selectedLocale;

  final void Function() back;
  final void Function() acceptTermsAndNavigate;
  final String Function(String) titleText;
  final String Function(String) buttonText;
  final String Function(String) backButtonText;

  const TermsPageVM({
    @required this.back,
    @required this.titleText,
    @required this.termsText,
    @required this.buttonText,
    @required this.selectedLocale,
    @required this.backButtonText,
    @required this.acceptTermsAndNavigate,
  });

  static TermsPageVM fromStore(Store<AppState> store) {
    return TermsPageVM(
      /// StorageDataSelector
      termsText: StorageDataSelector.getTermsText(store),

      /// StorageLanguageSelector
      titleText: StorageLanguageSelector.getTermsTitleText(store),
      buttonText: StorageLanguageSelector.getTermsButtonText(store),
      backButtonText: StorageLanguageSelector.getBackButtonText(store),
      selectedLocale: StorageLanguageSelector.getSelectedLocale(store),

      /// StorageFunctionSelector
      acceptTermsAndNavigate: StorageFunctionSelector.getAcceptTermsAndNavigateFunction(store),

      /// Another
      back: RouteSelectors.doPop(store),
    );
  }
}
