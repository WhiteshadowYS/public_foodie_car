import 'package:flutter/material.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

class LanguageDialogVM {
  final TextDirection textDirection;

  LanguageDialogVM({
    @required this.textDirection,
  });

  static LanguageDialogVM fromStore(Store<AppState> store) {
    return LanguageDialogVM(
      /// StorageDataSelector
      textDirection: StorageLanguageSelector.selectedLocaleDirection(store),
    );
  }
}
