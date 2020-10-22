import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_state.dart';
import 'package:my_catalog/store/shared/initialization/initialize_main_epic.dart';
import 'package:my_catalog/store/shared/loader/loader_state.dart';
import 'package:my_catalog/store/shared/storage/storage_main_epic.dart';
import 'package:my_catalog/store/shared/storage/storage_state.dart';
import 'package:redux_epics/redux_epics.dart';

// TODO(Yuri): Add comment for this State.
class AppState {
  final DialogState dialogState;
  final StorageState storageState;
  final LoaderState loaderState;

  AppState({
    @required this.dialogState,
    @required this.storageState,
    @required this.loaderState,
  });

  factory AppState.initial() {
    return AppState(
      dialogState: DialogState.initial(),
      storageState: StorageState.initial(),
      loaderState: LoaderState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      dialogState: state.dialogState.reducer(action),
      loaderState: state.loaderState.reducer(action),
      storageState: state.storageState.reducer(action),
    );
  }

  static final getAppEpic = combineEpics<AppState>([
    InitializeMainEpic.indexEpic,
    StorageMainEpic.indexEpic,
  ]);
}
