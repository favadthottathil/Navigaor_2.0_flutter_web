import 'package:flutter/material.dart';
import 'package:gorouter_sample/navigation_state.dart';

class UrlHandlerInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(RouteInformation routeInformation) async {
    return NavigationState(int.tryParse(routeInformation.location.substring(1)) ?? 0);
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    return RouteInformation(location: '/${configuration.value}');
  }
}
