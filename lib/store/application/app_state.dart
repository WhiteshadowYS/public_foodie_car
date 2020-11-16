import 'package:flutter/foundation.dart';

import 'package:redux_epics/redux_epics.dart';

import 'package:base_project_template/store/shared/loader/loader_state.dart';
import 'package:base_project_template/store/shared/dialog_state/dialog_state.dart';
import 'package:base_project_template/store/shared/initialization/initialize_main_epic.dart';

/// Class [AppState], is the main [state] application.
/// It keeps 3, smaller states.
/// Namely, [dialogState], [storageState], [loaderState].
/// First [dialogState], this variable stores the state of dialogs, it is used to call various dialogs.
/// Second [storageState], the primary state, stores all information from all states.
/// The third [loaderState] is required to loading.
class AppState {
  final DialogState dialogState;
  final LoaderState loaderState;

  AppState({
    @required this.dialogState,
    @required this.loaderState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      dialogState: DialogState.initial(),
      loaderState: LoaderState.initial(),
    );
  }

  ///The [getReducer] function is the main Reducer in which you call Reducer, all other states.
  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      dialogState: state.dialogState.reducer(action),
      loaderState: state.loaderState.reducer(action),
    );
  }
  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([
    InitializeMainEpic.indexEpic,
  ]);
}
