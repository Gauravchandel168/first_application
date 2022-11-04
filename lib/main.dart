import 'package:first_application/utills/routes.dart';
import 'package:first_application/widgets/themes.dart';
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
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme:MyTheme.lightTheme(context),


      initialRoute:MyRoute.homeRoute ,

      routes: {
        "/":(context) => LoginPage(),
        MyRoute.homeRoute:(Context) => HomePage(),
        MyRoute.loginRoute:(Context) => LoginPage(),

      },

    );
  }
}
