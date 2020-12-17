import 'package:base_project_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

/// [RouteService] it is service for routing in application.
/// This class it - Singleton, for function using use [RouteService.instance]
/// - For init service use method [init] in [PushNotificationsService].
/// - For get get current route you can use [currentRoute] getter.
/// - For get info if you can make pop use [canPop] getter.
/// - [_history] this list stores the history of page transitions in the form of routes.
/// Methods:
/// - [_isDialogDisplayed] check if and dialog is displayed.
/// - [pop] this method check if routes history is not empty and if any dialog is displayed, delete last route from history and make Pop
/// - [push] this method check if routes history is not empty, if any dialog is displayed and if next route not equal to current route
///           then add to history route passed as a parameter and make push to this route.
/// - [pushAndRemoveUntil] this method check if routes history is not empty, if any dialog is displayed and if next route not equal to current route
///                        then clear history, add to history route passed as a parameter and make pushNamedAndRemoveUntil to this route.
/// - [replace] this method check if routes history is not empty, if any dialog is displayed and if next route not equal to current route,
///             then check if history is not empty and remove last route from history. After that it make replace to route passed as a parameter.

class RouteService {
  static const tag = '[RouteService]';

  RouteService._privateConstructor();

  static final RouteService _instance = RouteService._privateConstructor();

  static RouteService get instance => _instance;

  final List<String> _history = [];

  String get currentRoute => _history.isNotEmpty ? _history.last : null;

  bool get canPop {
    return NavigatorHolder.navigatorKey.currentState.canPop() && _history.length > 1;
  }

  NavigateToAction pop() {
    if (_isDialogDisplayed()) return null;
    if (_history == null || _history.isEmpty) return null;

    _history.removeLast();

    return NavigateToAction.pop();
  }

  NavigateToAction push(String route) {
    if (_history == null || _isDialogDisplayed()) return null;
    if (_history.isNotEmpty && _history.last == route) return null;

    _history.add(route);

    return NavigateToAction.push(route);
  }

  NavigateToAction pushAndRemoveUntil(String route) {
    if (_history == null || _isDialogDisplayed()) return null;
    if (_history.isNotEmpty && _history.last == route) return null;

    _history.clear();
    _history.add(route);

    return NavigateToAction.pushNamedAndRemoveUntil(route, (route) => false);
  }

  NavigateToAction replace(String route) {
    if (_isDialogDisplayed()) return null;
    if (_history.isNotEmpty && _history.last == route) return null;

    if (_history.isNotEmpty) _history.removeLast();
    _history.add(route);

    return NavigateToAction.replace(route);
  }

  bool _isDialogDisplayed() {
    return DialogService.instance.isDisplayed;
  }
}
