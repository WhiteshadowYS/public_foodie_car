import 'package:foodie_client_template/store/basket_state/busket_state.dart';
import 'package:foodie_client_template/store/brands_state/brands_main_epic.dart';
import 'package:foodie_client_template/store/brands_state/brands_state.dart';
import 'package:foodie_client_template/store/shared/language_state/language_state.dart';
import 'package:flutter/foundation.dart';

import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:foodie_client_template/store/shared/dialog_state/dialog_state.dart';
import 'package:foodie_client_template/store/shared/initialization/initialize_main_epic.dart';

/// Class [AppState], is the main [state] application.
/// It keeps 3, smaller states.
/// Namely, [dialogState], [storageState], [loaderState].
/// First [dialogState], this variable stores the state of dialogs, it is used to call various dialogs.
/// Second [storageState], the primary state, stores all information from all states.
/// The third [loaderState] is required to loading.
class AppState {
  final DialogState dialogState;
  final LoaderState loaderState;
  final LanguageState languageState;
  final BusketState busketState;
  final BrandsState brandsState;

  AppState({
    @required this.dialogState,
    @required this.loaderState,
    @required this.languageState,
    @required this.busketState,
    @required this.brandsState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      languageState: LanguageState.initial(),
      dialogState: DialogState.initial(),
      loaderState: LoaderState.initial(),
      busketState: BusketState.initial(),
      brandsState: BrandsState.initial(),
    );
  }

  ///The [getReducer] function is the main Reducer in which you call Reducer, all other states.
  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      dialogState: state.dialogState.reducer(action),
      loaderState: state.loaderState.reducer(action),
      languageState: state.languageState.reducer(action),
      busketState: state.busketState.reducer(action),
      brandsState: state.brandsState.reducer(action),
    );
  }

  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([
    InitializeMainEpic.indexEpic,
    BrandsMainEpic.indexEpic,
  ]);
}
