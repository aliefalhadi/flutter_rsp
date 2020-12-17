import 'package:flutter/material.dart';
import 'package:flutterstarter/locator.dart';
import 'package:flutterstarter/services/DatabaseService.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:flutterstarter/views/Login.dart';
import 'package:flutterstarter/views/Router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  locator<DatabaseService>().initDb().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:
          GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        inputDecorationTheme: themeInput
      ),
      home: Login(),
      onGenerateRoute: RouterApp.generateRoute,
    );
  }
}

