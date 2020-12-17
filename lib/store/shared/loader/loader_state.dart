import 'dart:collection';
import 'package:base_project_template/domain/functional_services/dialog_service/interfaces/i_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:base_project_template/store/shared/loader/actions/start_loading_action.dart';
import 'package:base_project_template/store/shared/loader/actions/stop_loading_action.dart';
import 'package:base_project_template/store/shared/reducer.dart';

enum LoaderKey {
  global,

  initializationLoading,
  checkIdLoading,
  getData,
}

class LoaderState {
  List<ILoader> loaders;

  LoaderState({
    @required this.loaders,
  });

  factory LoaderState.initial() {
    return LoaderState(
      loaders: <ILoader>[],
    );
  }

  LoaderState copyWith({
    List<ILoader> loaders,
  }) {
    return LoaderState(
      loaders: loaders ?? this.loaders,
    );
  }

  LoaderState reducer(dynamic action) {
    return Reducer<LoaderState>(
      actions: HashMap.from({
        StartLoadingAction: (dynamic action) => _startLoading(action as StartLoadingAction),
        StopLoadingAction: (dynamic action) => _stopLoading(action as StopLoadingAction),
      }),
    ).updateState(action, this);
  }

  LoaderState _startLoading(StartLoadingAction action) {
    final int index = loaders.indexWhere((e) => e.loaderKey == action.loader.loaderKey);

    if (index == -1) {
      return copyWith(
        loaders: loaders..add(action.loader),
      );
    }

    return this;
  }

  LoaderState _stopLoading(StopLoadingAction action) {
    return copyWith(
      loaders: loaders..removeWhere((loader) => loader.loaderKey == action.loaderKey),
    );
  }
}
