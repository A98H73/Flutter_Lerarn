import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawerPage extends StatelessWidget {
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Abhijeet Singh"),
              accountEmail: Text("Flames_01@gmail.com"),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.amber,
            ),
            title: Text(
              "Home  Page",
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.amber,
            ),
            title: Text(
              "Email account",
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.amber,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                fontFamily: GoogleFonts.lato().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
