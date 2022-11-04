import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl=
       " https://www.google.com/search?q=haryana&sxsrf=ALiCzsYEXRZ31DqM3E05y5NBEtvKKwhEZw:1667391348285&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiXj5DovI_7AhXCR2wGHcnGBxoQ_AUoA3oECAEQBQ#imgrc=0kgdbKqH5P2AXM";
    return Drawer(
    child:Container(
    color: Colors.deepPurple,
    child:ListView(
    padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
             margin: EdgeInsets.zero,
           // ),

        accountName: Text("Gaurav pal"),
              accountEmail: Text("chandel@gmail.com"),
            currentAccountPicture: CircleAvatar(
             backgroundImage: NetworkImage(imageUrl),
    ),



      ),
            ),

            ListTile(
       leading:Icon(
       CupertinoIcons.home,
        color: Colors.white ,
    ),
    title: Text("Home",
    textScaleFactor: 1.2,
    style:TextStyle(
      color:Colors.white,
    ),
    ),
          ),

    ListTile(
    leading:Icon(
    CupertinoIcons.profile_circled,
    color: Colors.white ,
    ),
    title: Text("Profile",
    textScaleFactor: 1.2,
    style:TextStyle(color:Colors.white,

    ),
    ),
    ),
    ListTile(
    leading:Icon(
    CupertinoIcons.mail,
    color: Colors.white ,
    ),
    title: Text("Email Me",
    textScaleFactor: 1.2,
    style:TextStyle(color: Colors.white,

    ),
    ),
    ),

        ],
      ),
    ),
    );
  }
}
