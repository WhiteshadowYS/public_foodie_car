import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

///[TermsPageVM] view model for TermsPage
///[termsText] - string with terms text which is taken from [StorageDataSelector.getTermsText].
///[selectedLocale] - string with selected locale which is taken from [StorageLanguageSelector.getSelectedLocale].
///[back] - void function for pop navigation which is taken from [RouteSelectors.doPop].
///[acceptTermsAndNavigate] - void function for accepting terms and navigating to next page which is taken from [StorageFunctionSelector.getAcceptTermsAndNavigateFunction].
///[titleText] - void function with string param for getting title text from [StorageLanguageSelector.getTermsTitleText].
///[buttonText] - void function with string param for getting button text from [StorageLanguageSelector.getTermsButtonText].
///[backButtonText] - void function with string param for getting text for back button from [StorageLanguageSelector.getBackButtonText].

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
