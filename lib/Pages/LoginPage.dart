import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/MyRoutes.dart';
import 'package:flutter_catalog/utils/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);

  User user = new User('', '');
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    print("Hello world");
    var res = await http.post(Uri.parse("http://localhost:8008/signin"),
        headers: <String, String>{
          'Context-type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'email': user.email,
          'password': user.password
        });
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/login_pic.png",
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Welcome to App",
                style: TextStyle(
                  color: Colors.orangeAccent[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: TextEditingController(text: user.email),
                      onChanged: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Field cannot be empty';
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Enter Valid Email';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user.password),
                      onChanged: (value) {
                        user.password = value;
                      },
                      validator: (value) {
                        /* 
                               RegExp for Password not required here
                        
                        
                        
                        RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)
                            
                        */
                        if (value == null) {
                          return "Password can't be empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      child: Text("LOGIN"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, MyRoutings.homeRoute);
                        } else {
                          "problem signin- check";
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Do not Registered?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRoutings.SignUpRoute);
                          },
                          child: Container(
                            child: Text(
                              "  SignUp",
                              style: TextStyle(
                                  color: Colors.lightBlue[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            alignment: Alignment.centerLeft,
                            height: 30,
                            width: 100,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
