import 'package:flutter/material.dart';
import 'package:flutterstarter/views/Dashboard.dart';
import 'package:flutterstarter/views/Register.dart';
import 'package:flutterstarter/views/latihan/TestLatihan.dart';
import 'package:flutterstarter/views/modul/ModulBelajarDetail.dart';
import 'package:flutterstarter/views/modul/ModulBelajarIndex.dart';

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

      case '/modul/belajar':
        Map data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => ModulBelajarIndex(idModul: data['idModul'], namaModul: data['namaModul'],)
        );

      case '/modul/belajar/detail':
        var data = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => ModulBelajarDetail(indexModulbelajar: data,)
        );

      case '/test-latihan':
        return MaterialPageRoute(
            builder: (_) => TestLatihan()
        );
    }
  }
}