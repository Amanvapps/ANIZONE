import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteramazonclone/screens/view/home_screen.dart';
import 'package:flutteramazonclone/screens/auth/login_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
//      canvasColor: Colors.transparent,
      cursorColor: Colors.white,
      primaryTextTheme: Typography.material2018(platform: TargetPlatform.iOS).white,
      textTheme: Typography.material2018(platform: TargetPlatform.iOS).white,
      primaryColor: Colors.green[200],
    ),
    home: LoginScreen(),
  ));
}
