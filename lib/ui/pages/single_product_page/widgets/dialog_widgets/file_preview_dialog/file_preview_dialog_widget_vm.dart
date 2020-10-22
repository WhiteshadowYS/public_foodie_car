import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

class FilePreviewDialogWidgetVM {
  final String currentLocale;

  const FilePreviewDialogWidgetVM({
    @required this.currentLocale,
  });

  static FilePreviewDialogWidgetVM fromStore(Store<AppState> store) {
    return FilePreviewDialogWidgetVM(
      currentLocale: StorageLanguageSelector.getSelectedLocale(store),
    );
  }
}
