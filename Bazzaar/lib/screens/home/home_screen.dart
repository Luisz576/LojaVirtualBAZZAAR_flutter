import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BAZZAAR",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24
          ),
        ),
      ),
      body: Center(
        child: Text("Hello world!"), //TEMP
      ),
    );
  }
}