import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset("assets/images/login_pic.png"),
        Center(
          child: Text(
            "LoginPage1",
            style: TextStyle(
              color: Colors.tealAccent[400],
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
      ],
    ));
  }
}
