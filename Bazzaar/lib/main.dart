import 'package:flutter/material.dart';
import 'package:Bazzaar/screens/home/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BAZZAAR",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}