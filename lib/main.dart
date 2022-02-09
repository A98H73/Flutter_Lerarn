import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/HomePage.dart';
import 'package:flutter_catalog/Pages/LoginPage.dart';
import 'package:flutter_catalog/Pages/SignUp.dart';
import 'package:flutter_catalog/utils/MyRoutes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Mythemes.lightTheme(context),
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        //"/": (context) => LoginPage(),
        MyRoutings.homeRoute: (context) => HomePage(),
        MyRoutings.loginRoute: (context) => LoginPage(),
        MyRoutings.SignUpRoute: (context) => SignUpPage(),
      },
    );
  }
}
