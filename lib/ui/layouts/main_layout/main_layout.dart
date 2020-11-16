import 'dart:io';

import 'package:base_project_template/dictionary/models/language.dart';
import 'package:base_project_template/models/interfaces/i_view_model.dart';
import 'package:base_project_template/services/route_service/route_service.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:base_project_template/theme/custom_theme.dart';
import 'package:base_project_template/ui/layouts/main_layout/main_layout_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// The [MainLayout] class, the base layer from which the remaining page is created.
/// Params:
///   - [child] here is the page itself.
///   - [bgColor] background color.
///   - [appBar] accepts AppBar.
///   - [bottomBar] accepts BottomBar.
///   - [resizeToAvoidBottomPadding] принимает параметр resizeToAvoidBottomPadding
///   - [back] function returns to the previous page.
///   - [canExit] variable that is responsible for whether or not a complete exit from the application is performed?

class TestPageViewModel implements IViewModel {
  static TestPageViewModel fromStore(Store<AppState> store) {
    return TestPageViewModel();
  }
}

class PageData<T> {
  final T viewModel;
  final Locale locale;
  final Language language;
  final TextDirection textDirection;
  final CustomTheme theme;

  PageData({
    @required this.viewModel,
    @required this.locale,
    @required this.language,
    @required this.textDirection,
    @required this.theme,
  });
}

class TestPage extends StatelessWidget {

  TestPage() : super(key: Key('TestPageKey'));

  @override
  Widget build(BuildContext context) {
    return MainLayout<TestPageViewModel>(
      key: Key('TestPageMainLayoutKey'),
      converter: TestPageViewModel.fromStore,
      tabletBuilder: (BuildContext context, PageData pageData, Widget child) {
        return Container();
      },
      iosTabletBuilder: (BuildContext context, PageData pageData, Widget child) {
        return Container();
      },
      iosBuilder: (BuildContext context, PageData pageData, Widget child) {
        return Container();
      },
      builder: (BuildContext context, PageData pageData, Widget child) {
        return Container();
      },
      child: Container(),
    );
  }
}

typedef MainLayoutBuilder = Widget Function(BuildContext context, PageData pageData, Widget child);

class MainLayout<T> extends StatefulWidget {
  final T Function(Store<AppState>) converter;
  final void Function(Store<AppState> store) onInit;
  final void Function(Store<AppState> store) onDispose;
  final void Function(T) onInitialBuild;

  final MainLayoutBuilder builder;
  final MainLayoutBuilder iosBuilder;
  final MainLayoutBuilder iosTabletBuilder;
  final MainLayoutBuilder tabletBuilder;
  final Widget child;

  final bool canExit;
  final PreferredSizeWidget appBarWidget;

  final void Function() onPop;

  MainLayout({
    @required Key key,
    @required this.converter,
    @required this.builder,
    this.iosBuilder,
    this.iosTabletBuilder,
    this.tabletBuilder,
    this.appBarWidget,
    this.child = const SizedBox(),
    this.onInit,
    this.onDispose,
    this.onInitialBuild,
    this.canExit = false,
    this.onPop,
  }) : super(key: key);

  @override
  _MainLayoutState<T> createState() => _MainLayoutState<T>();
}

class _MainLayoutState<T> extends State<MainLayout<T>> {
  DateTime _lastPopDateTime;

  bool _isIos(BuildContext context) => Platform.isIOS;

  bool _isTablet(BuildContext context) => MediaQuery.of(context).size.width > 600.0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainLayoutVM>(
      converter: MainLayoutVM.fromStore,
      builder: (BuildContext context, MainLayoutVM layoutVM) {
        return WillPopScope(
          onWillPop: () => _willPopScope(layoutVM),
          child: Scaffold(
            body: StoreConnector<AppState, T>(
              converter: widget.converter,
              onInit: widget.onInit,
              onDispose: widget.onDispose,
              onInitialBuild: widget.onInitialBuild,
              builder: (BuildContext context, T vm) {
                if (_isTablet(context) && _isIos(context) && widget.iosTabletBuilder != null) {
                  return widget.iosTabletBuilder(
                    context,
                    PageData<T>(
                      viewModel: vm,
                      locale: layoutVM.locale,
                      language: layoutVM.language,
                      textDirection: layoutVM.textDirection,
                      theme: CustomTheme.instance,
                    ),
                    widget.child,
                  );
                }

                if (_isTablet(context) && widget.tabletBuilder != null) {
                  return widget.tabletBuilder(
                    context,
                    PageData<T>(
                      viewModel: vm,
                      locale: layoutVM.locale,
                      language: layoutVM.language,
                      textDirection: layoutVM.textDirection,
                      theme: CustomTheme.instance,
                    ),
                    widget.child,
                  );
                }

                if (_isIos(context) && widget.iosBuilder != null) {
                  return widget.iosBuilder(
                    context,
                    PageData<T>(
                      viewModel: vm,
                      locale: layoutVM.locale,
                      language: layoutVM.language,
                      textDirection: layoutVM.textDirection,
                      theme: CustomTheme.instance,
                    ),
                    widget.child,
                  );
                }

                return widget.builder(
                  context,
                  PageData<T>(
                    viewModel: vm,
                    locale: layoutVM.locale,
                    language: layoutVM.language,
                    textDirection: layoutVM.textDirection,
                    theme: CustomTheme.instance,
                  ),
                  widget.child,
                );
              },
            ),
          ),
        );
      },
    );
  }

  /// The [_onDoublePop] function, when you double-click the button back, minimizes the application.
  void _onDoublePop() {
    if (_lastPopDateTime != null && DateTime.now().difference(_lastPopDateTime) < Duration(seconds: 1)) {
      widget.onPop();
    }
    _lastPopDateTime = DateTime.now();
  }

  /// [_willPopScope] function for [WillPopScope] widget.
  /// This function will
  Future<bool> _willPopScope(MainLayoutVM layoutVM) async {
    if (widget.canExit) {
      _onDoublePop();
      return false;
    }

    _lastPopDateTime = DateTime.now();

    if (widget.onPop != null) {
      widget.onPop();
      return false;
    }

    if (RouteService.instance.canPop) {
      layoutVM.doRoute(RouteService.instance.pop());
    }

    return false;
  }
}
