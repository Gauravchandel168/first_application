import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var days = 30;
  var name = "codepur";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),


      body: Center(
          child: Text("welcome to  $days of flutter by $name")
      ),

      drawer: Drawer(),
    );
  }
}
