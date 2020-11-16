import 'dart:io';

import 'package:base_project_template/dictionary/models/language.dart';
import 'package:base_project_template/models/interfaces/i_view_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return MainLayout<TestPageViewModel>(
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

class MainLayout<T> extends StatelessWidget {
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
    this.child = const SizedBox(),

    this.onInit,
    this.onDispose,
    this.onInitialBuild,

    this.canExit = false,
    this.onPop,
  }) : super(key: key);

  bool _isTablet(BuildContext context) => MediaQuery.of(context).size.width > 600.0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPopScope(vm),
      child: Scaffold(
        body: StoreConnector<AppState, MainLayoutVM>(
          converter: MainLayoutVM.fromStore,
          builder: (BuildContext context, MainLayoutVM layoutVM) {
            return StoreConnector<AppState, T>(
              converter: converter,
              onInit: onInit,
              onDispose: onDispose,
              onInitialBuild: onInitialBuild,
              builder: (BuildContext context, T vm) {
                if (_isTablet(context) && _isIos(context) && iosTabletBuilder != null) {
                  return iosTabletBuilder(
                    context,
                    PageData<T>(
                      viewModel: vm,
                      locale: layoutVM.locale,
                      language: layoutVM.language,
                      textDirection: layoutVM.textDirection,
                      theme: CustomTheme.instance,
                    ),
                    child,
                  );
                }

                if (_isTablet(context) && tabletBuilder != null) {
                  return tabletBuilder(
                    context,
                    PageData<T>(
                      viewModel: vm,
                      locale: layoutVM.locale,
                      language: layoutVM.language,
                      textDirection: layoutVM.textDirection,
                      theme: CustomTheme.instance,
                    ),
                    child,
                  );
                }

                if (_isIos(context) && iosBuilder != null) {
                  return iosBuilder(
                    context,
                    PageData<T>(
                      viewModel: vm,
                      locale: layoutVM.locale,
                      language: layoutVM.language,
                      textDirection: layoutVM.textDirection,
                      theme: CustomTheme.instance,
                    ),
                    child,
                  );
                }

                return builder(
                  context,
                  PageData<T>(
                    viewModel: vm,
                    locale: layoutVM.locale,
                    language: layoutVM.language,
                    textDirection: layoutVM.textDirection,
                    theme: CustomTheme.instance,
                  ),
                  child,
                );
              },
            );
          }
        ),
      ),
    );
  }

  bool _isIos(BuildContext context) => Platform.isIOS;

  /// [_willPopScope] function for [WillPopScope] widget.
  /// This function will
  Future<bool> _willPopScope(MainLayoutVM vm) async {
    if (canExit) {
      _onDoublePop();
      return false;
    }

    if (back != null) {
      back();
      return false;
    }

    if (RouteService.instance.canPop) {
      vm.doRoute(RouteService.instance.pop());
    }

    return false;
  }
}

// final bool canExit;
// final bool resizeToAvoidBottomPadding;
//
// final Color bgColor;
//
// final Widget bottomBar;
// final PreferredSizeWidget appBar;
//
// final void Function() back;
//
// final Widget child;

//
// /// The [_onDoublePop] function, when you double-click the button back, minimizes the application.
// void _onDoublePop() {
//   final DateTime nowDate = DateTime.now();
//   if (_currentBackPressTime != null && nowDate.difference(_currentBackPressTime) < Duration(seconds: 1)) {
//     widget.back();
//   }
//   _currentBackPressTime = nowDate;
// }
