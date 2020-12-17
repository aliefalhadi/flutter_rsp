import 'package:flutter/material.dart';


final colorPrimary= Color(0xff3d8fa6);

final textHeader = TextStyle(fontSize: 24, color: Colors.white);




final themeInput = InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(color: Colors.blue)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 1.0),
    ),
    contentPadding:
    new EdgeInsets.symmetric(vertical: 15, horizontal: 8),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.red, width: 1.0),
        borderRadius:
        BorderRadius.circular(8)),
  );