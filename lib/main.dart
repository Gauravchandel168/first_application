import 'package:first_application/utills/routes.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      themeMode:ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      initialRoute: "/",

      routes: {
        "/":(context) => LoginPage(),
        MyRoute.homeRoute:(Context) => HomePage(),
        MyRoute.loginRoute:(Context) => LoginPage(),

      },

    );
  }
}
