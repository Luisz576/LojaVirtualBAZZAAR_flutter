import 'package:Bazzaar/screens/home/widgets/category_view.dart';
import 'package:Bazzaar/screens/home/widgets/products_view.dart';
import 'package:Bazzaar/screens/home/widgets/search_camp.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: ListView(
          children: [
            SearchCamp(),
            CategoryView(_animationController),
            ProductsView(),
          ],
        ),
      ),
    );
  }

}