import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Abhijeet1";
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Caterlog App"),
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days my first App $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
