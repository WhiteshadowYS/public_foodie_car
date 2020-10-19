import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/loader_layout/loader_layout.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout_vm.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final PreferredSizeWidget appBar;
  final Widget bottomBar;
  final bool resizeToAvoidBottomPadding;
  final Function back;
  final bool canExit;

  MainLayout({
    Key key,
    this.appBar,
    this.bottomBar,
    this.bgColor,
    this.child,
    this.back,
    this.resizeToAvoidBottomPadding = false,
    this.canExit = false,
  }) : super(key: key);

  DateTime _currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainLayoutVM>(
      converter: MainLayoutVM.fromStore,
      builder: (BuildContext context, MainLayoutVM vm) {
        return WillPopScope(
          onWillPop: () async {
            if (canExit) {
              _onDoubleClick();
            } else if (back != null) {
              back();
            }

            if (RouteService.instance.canPop) {
              vm.doRoute(RouteService.instance.pop());
            }

            return false;
          },
          child: Scaffold(
            resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
            appBar: appBar,
            backgroundColor: bgColor,
            bottomNavigationBar: bottomBar,
            body: GestureDetector(
              onTap: () {
                if (FocusScope.of(context).hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Container(
                color: bgColor,
                width: double.infinity,
                height: double.infinity,
                child: LoaderLayout(
                  key: Key(key.toString() + 'Loader'),
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onDoubleClick() {
    final DateTime now = DateTime.now();
    if (_currentBackPressTime != null && now.difference(_currentBackPressTime) < Duration(seconds: 1)) {
      return back();
    }
    _currentBackPressTime = now;
  }
}
