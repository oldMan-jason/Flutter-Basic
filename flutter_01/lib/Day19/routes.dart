import 'package:flutter/material.dart';

import './pages/checkbox.dart';
import './pages/switch.dart';
import './pages/radio.dart';
import './pages/textfield.dart';

var routes = {
  "/checkbox": (context) => CheckBoxPage(),
  "/switch": (context) => SwitchPage(),
  "/raido": (context) => RadioPage(),
  "/textfield": (context) => TextFieldPage()
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name; //  /news 或者 /search
  final Function? pageContentBuilder =
      routes[name]; //  Function = (contxt) { return const NewsPage()}

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};
