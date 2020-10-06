import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/global/storage/storage_epics.dart';
import 'package:my_catalog/store/global/storage/storage_state.dart';
import 'package:my_catalog/store/pages/home_page/storage_id_text_field_state/storage_id_text_field_state.dart';

import 'package:redux_epics/redux_epics.dart';

import 'package:my_catalog/res/const.dart';

import 'package:my_catalog/store/shared/dialog_state/dialog_state.dart';
import 'package:my_catalog/store/shared/initialization/initialize_epics.dart';

class AppState {
  final DialogState dialogState;
  final StorageState storageState;
  final StorageIdTextFieldState storageIdTextFieldState;

  AppState({
    @required this.dialogState,
    @required this.storageState,
    @required this.storageIdTextFieldState,
  });

  factory AppState.initial() {
    return AppState(
      dialogState: DialogState.initial(),
      storageState: StorageState.initial(),
      storageIdTextFieldState: StorageIdTextFieldState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    const String TAG = '[appReducer]';

    logger.i('$TAG  => <appReducer> => action: ${action.runtimeType}');

    return AppState(
      dialogState: state.dialogState.reducer(action),
      storageState: state.storageState.reducer(action),
      storageIdTextFieldState: state.storageIdTextFieldState.reducer(action),
    );
  }

  static final getAppEpic = combineEpics<AppState>([
    InitializeEpics.indexEpic,
    StorageEpics.indexEpic,
  ]);
}
