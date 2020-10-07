// import 'dart:collection';
// import 'package:example_redux/store/shared/loader/loader_actions.dart';
// import 'package:example_redux/store/shared/interfaces/loader.dart';
// import 'package:example_redux/store/shared/models/reducer.dart';
// import 'package:flutter/cupertino.dart';
//
// enum LoaderKey {
//   initializationLoading,
//   loginLoading,
// }
//
// class LoaderState {
//   List<LoaderDialog> loaders;
//
//   LoaderState({
//     @required this.loaders,
//   });
//
//   factory LoaderState.initial() {
//     return LoaderState(
//       loaders: List(),
//     );
//   }
//
//   LoaderState copyWith({
//     List<LoaderDialog> loaders,
//   }) {
//     return LoaderState(
//       loaders: loaders ?? this.loaders,
//     );
//   }
//
//   LoaderState reducer(dynamic action) {
//     return Reducer<LoaderState>(
//       actions: HashMap.from({
//         StartLoading: (dynamic action) => startLoading(action as StartLoading),
//         StopLoading: (dynamic action) => stopLoading(action as StopLoading),
//       }),
//     ).updateState(action, this);
//   }
//
//   LoaderState startLoading(StartLoading action) {
//     return this.copyWith(
//       loaders: this.loaders..add(action.loader),
//     );
//   }
//
//   LoaderState stopLoading(StopLoading action) {
//     return this.copyWith(
//       loaders: this.loaders..removeWhere((loader) => loader.loaderKey == action.loaderKey),
//     );
//   }
// }
