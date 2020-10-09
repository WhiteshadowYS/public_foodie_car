import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/loader_layout/loader_layout_vm.dart';

class LoaderLayout extends StatelessWidget {
  final Widget child;

  LoaderLayout({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoaderLayoutVM>(
      converter: LoaderLayoutVM.fromStore,
      builder: (BuildContext context, LoaderLayoutVM vm) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              child,
              ...vm.loaders.map<Widget>((loader) {
                return loader.widget;
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
