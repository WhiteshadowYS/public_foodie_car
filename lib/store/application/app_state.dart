import 'package:flutter/foundation.dart';

import 'package:redux_epics/redux_epics.dart';

import 'package:pictures_view/res/const.dart';

import 'package:pictures_view/store/pages/home_page_state/home_page_state.dart';
import 'package:pictures_view/store/pages/settings_page_state/settings_page_state.dart';

class AppState {
  HomePageState homePageState;
  SettingsPageState settingsPageState;

  AppState({
    @required this.homePageState,
    @required this.settingsPageState,
  });

  factory AppState.initial() {
    return AppState(
      homePageState: HomePageState.initial(),
      settingsPageState: SettingsPageState.initial(),
    );
  }

  static AppState getReducer(AppState state, dynamic action) {
    const String TAG = '[appReducer]';

    logger.i('$TAG  => <appReducer> => action: ${action.runtimeType}');

    return AppState(
      homePageState: state.homePageState.reducer(action),
      settingsPageState: state.settingsPageState.reducer(action),
    );

  }
  static final getAppEpic = combineEpics<AppState>([

  ]);
}
