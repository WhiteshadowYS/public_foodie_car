import 'package:flutter/cupertino.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_loader.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:redux/redux.dart';

class LoaderLayoutVM {
  final List<ILoader> loaders;

  LoaderLayoutVM({
    @required this.loaders,
  });

  static LoaderLayoutVM fromStore(Store<AppState> store) {
    return LoaderLayoutVM(
      loaders: store.state.loaderState.loaders,
    );
  }
}
