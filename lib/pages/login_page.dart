import 'package:first_application/utills/routes.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "";
  var changeButton = false;

  final  _formKey= GlobalKey<FormState>();

 moveToHome(BuildContext context)  async  {
   if (_formKey.currentState!.validate()) {
     setState(() {
       changeButton = true;
     });
     await Future.delayed(Duration(seconds: 1));
     await Navigator.pushNamed(context, MyRoute.homeRoute);
     setState(() {
       changeButton = false;
     });
   }
}





  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // SizedBox(
                //   height: 30.0,
                // ),
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                  // child: Text("lmao"),
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "username",
                        ),
                        validator: (value) {
                      if (value!.isEmpty) {
                        return"Username cannot be empty";
                      }

                      return null ;
                        },



                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "password",
                        ),
                          validator: (value) {
                            if(value!.isEmpty) {
                              return"Password cannot be empty"; }
                     else if(value.length<6) {
                      return"Password length should be atleast6"; }

                            return null ;
                          }


                      ),




                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color:Colors.deepPurple,
                        borderRadius:
                        BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(

                          onTap: () =>moveToHome(context),


                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),

                              //shape: changeButton?BoxShape.circle
                              //BoxShape.rectangle,

                            ),
                          ),
                        ),


                      //  ElevatedButton(
                      //  child: Text("login"),
                      // style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                      //onPressed: () {
                      // Navigator.pushNamed(context, MyRoute.homeRoute);
                      //},
                      // style: TextButton.styleFrom(),
                      //)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
