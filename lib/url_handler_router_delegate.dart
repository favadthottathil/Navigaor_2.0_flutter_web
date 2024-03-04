import 'package:flutter/material.dart';
import 'package:gorouter_sample/myhome_page.dart';
import 'package:gorouter_sample/navigation_state.dart';

final GlobalKey<NavigatorState> _urlHandlerRouterDelegateNavigatorKey = GlobalKey<NavigatorState>();

class UrlHandlerRouterDelegate extends RouterDelegate<NavigationState> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: HomePage(count: count, increase: increase))
      ],
      onPopPage: (route, result) {
        return false;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _urlHandlerRouterDelegateNavigatorKey;

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    if (configuration.value == null) {
      notifyListeners();
      return;
    }

    // Get New Count
    count = (configuration.value / 10).floor();

    // Check url is not equal to count * 10
    if (count * 10 != configuration.value) {
      notifyListeners();
      return;
    }
  }

  // App state to Navigation State
  @override
  NavigationState? get currentConfiguration => NavigationState(count * 10);

  void increase() {
    count++;
    notifyListeners();
  }
}
