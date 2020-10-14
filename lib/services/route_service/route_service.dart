import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';

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
    if (_history.isEmpty) return null;

    _history.removeLast();

    return NavigateToAction.pop();
  }

  NavigateToAction push(String route) {
    if (_isDialogDisplayed()) return null;
    if (_history.isNotEmpty && _history.last == route) return null;

    _history.add(route);

    return NavigateToAction.push(route);
  }

  NavigateToAction pushAndRemoveUntil(String route) {
    if (_isDialogDisplayed()) return null;
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
