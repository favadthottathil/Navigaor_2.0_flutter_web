import 'package:flutter/material.dart';
import 'package:gorouter_sample/route_infromation_parser.dart';
import 'package:gorouter_sample/url_handler_router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: UrlHandlerRouterDelegate(),
      routeInformationParser: UrlHandlerInformationParser(),
    );
  }
}
