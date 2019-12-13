import 'dart:io' show Platform;

import "package:flutter/material.dart";
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;

import 'screens/intro.dart';

class FlutterStore extends StatefulWidget {
  @override
  _FlutterStoreState createState() => _FlutterStoreState();
}

class _FlutterStoreState extends State<FlutterStore> {
  @override
  void initState() {
    super.initState();
    if (Platform.isIOS)
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fluter Store",
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
      home: IntroScreen(),
    );
  }
}

void main() => runApp(FlutterStore());
