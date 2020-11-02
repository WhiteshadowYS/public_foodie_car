import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/loader_layout/loader_layout.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout_vm.dart';

/// The [MainLayout] class, the base layer from which the remaining page is created.
/// Params:
///   - [child] here is the page itself.
///   - [bgColor] background color.
///   - [appBar] accepts AppBar.
///   - [bottomBar] accepts BottomBar.
///   - [resizeToAvoidBottomPadding] принимает параметр resizeToAvoidBottomPadding
///   - [back] function returns to the previous page.
///   - [canExit] variable that is responsible for whether or not a complete exit from the application is performed?
class MainLayout extends StatefulWidget {
  final bool canExit;
  final bool resizeToAvoidBottomPadding;
  final Color bgColor;
  final Widget bottomBar;
  final PreferredSizeWidget appBar;
  final Function back;
  final Widget child;

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

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  DateTime _currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainLayoutVM>(
      converter: MainLayoutVM.fromStore,
      builder: (BuildContext context, MainLayoutVM vm) {
        return WillPopScope(
          onWillPop: () => _willPopScope(vm),
          child: Scaffold(
            resizeToAvoidBottomPadding: widget.resizeToAvoidBottomPadding,
            appBar: widget.appBar,
            backgroundColor: widget.bgColor,
            bottomNavigationBar: widget.bottomBar,
            body: Directionality(
              textDirection: vm.direction ?? TextDirection.ltr,
              child: GestureDetector(
                onTap: () {
                  if (FocusScope.of(context).hasFocus) {
                    FocusScope.of(context).unfocus();
                  }
                },
                child: Container(
                  color: widget.bgColor,
                  width: double.infinity,
                  height: double.infinity,
                  child: LoaderLayout(
                    key: Key(widget.key.toString() + 'Loader'),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// [_willPopScope] function for [WillPopScope] widget.
  /// This function will
  Future<bool> _willPopScope(MainLayoutVM vm) async {
    if (widget.canExit) {
      _onDoublePop();
      return false;
    }

    if (widget.back != null) {
      widget.back();
      return false;
    }

    if (RouteService.instance.canPop) {
      vm.doRoute(RouteService.instance.pop());
    }

    return false;
  }

  /// The [_onDoublePop] function, when you double-click the button back, minimizes the application.
  void _onDoublePop() {
    final DateTime nowDate = DateTime.now();
    if (_currentBackPressTime != null && nowDate.difference(_currentBackPressTime) < Duration(seconds: 1)) {
      widget.back();
    }
    _currentBackPressTime = nowDate;
  }
}
