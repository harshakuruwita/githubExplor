import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_explore/views/home.dart';
import 'package:github_explore/views/splash.dart';
import 'package:github_explore/views/user_login.dart';

class Router {
  static Route<dynamic> genarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/user_login':
        return MaterialPageRoute(builder: (_) => UserLogin());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());

      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
