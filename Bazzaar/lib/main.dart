import 'package:Bazzaar/screens/cartoes/cartoes_screen.dart';
import 'package:Bazzaar/screens/sobre/sobre_screen.dart';
import 'package:flutter/material.dart';
import 'package:Bazzaar/screens/home/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Widget> _screens = [
    HomeScreen(),
    SobreScreen(),
    CartoesScreen()
  ];

  int _index = 0;

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  Widget _bottomNavigatorBar(){
    return BottomNavigationBar(
      currentIndex: _index,
      backgroundColor: Color.fromRGBO(240, 208, 41, 1.0),
      onTap: onTabTapped,
      unselectedFontSize: 0,
      selectedFontSize: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _index == 0 ? Colors.black : Colors.black54, size: 35,),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store, color: _index == 1 ? Colors.black : Colors.black54, size: 35,),
          label: ""
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card, color: _index == 2 ? Colors.black : Colors.black54, size: 35,),
          label: ""
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BAZZAAR",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BAZZAAR",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
          ),
          backgroundColor: Color.fromRGBO(240, 208, 41, 1.0),
        ),
        bottomNavigationBar: _bottomNavigatorBar(),
        body: _screens[_index],
      ),
    );
  }
}