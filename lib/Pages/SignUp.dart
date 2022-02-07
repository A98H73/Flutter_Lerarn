import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/MyRoutes.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/images/signUp.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Hello $name",
              style: TextStyle(
                color: Colors.indigo[900],
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    labelText: "Name",
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              setState(() {
                check = true;
              });
              await Future.delayed(Duration(seconds: 1));
              Navigator.pushNamed(context, MyRoutings.homeRoute);
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 50,
              width: check ? 100 : 200,
              alignment: Alignment.center,
              child: check
                  ? Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
              decoration: BoxDecoration(
                color: Colors.amber[900],
                borderRadius: BorderRadius.circular(check ? 50 : 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
