import 'package:flutter/material.dart';
import 'package:flutterstarter/views/Dashboard.dart';
import 'package:flutterstarter/views/DetailCourse.dart';
import 'package:flutterstarter/views/Register.dart';

import 'Login.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
            builder: (_) => Dashboard()
        );

      case '/login':
        return MaterialPageRoute(
            builder: (_) => Login()
        );

      case '/register':
        return MaterialPageRoute(
            builder: (_) => Register()
        );

      case '/course/detail':
        return MaterialPageRoute(
            builder: (_) => DetailCourse()
        );
    }
  }
}