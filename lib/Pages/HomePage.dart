import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/MyDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Abhijeet1";
    return Scaffold(
      appBar: AppBar(
        title: Text("Caterlog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days my first App $name"),
        ),
      ),
      drawer: MyDrawerPage(),
    );
  }
}
