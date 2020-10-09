import 'package:flutter/material.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/ui/layouts/loader_layout/loader_layout.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final PreferredSizeWidget appBar;
  final Widget bottomBar;
  final bool resizeToAvoidBottomPadding;

  const MainLayout({
    Key key,
    this.appBar,
    this.bottomBar,
    this.bgColor,
    this.child,
    this.resizeToAvoidBottomPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => RouteService.instance.canPop,
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
  }
}
