import 'package:Bazzaar/models/category.dart';
import 'package:Bazzaar/screens/home/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {

  final AnimationController controller;

  CategoryView(this.controller);

  @override
  _CategoryViewState createState() => _CategoryViewState(controller);
}

class _CategoryViewState extends State<CategoryView> {

  final AnimationController controller;

  _CategoryViewState(this.controller) :
    animationGrouw = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      )
    );
  
  final Animation<double> animationGrouw;

  List<Category> categories = [
    Category(categoryName: "masc", title: "Masculino", image: "images/roupa-branca.jpg"),
    Category(categoryName: "fem", title: "Feminino", image: "images/roupa-branca-fem.jpg"),
    Category(categoryName: "inf", title: "Infantil", image: "images/roupa-branca.jpg"),
    Category(categoryName: "juv", title: "Juvenil", image: "images/roupa-branca.jpg"),
  ];

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categorias",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: screenSize.height * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((category) => CategoryItem(category: category, radius: screenSize.height * 0.1, animation: animationGrouw,)).toList(),
            ),
          ),
        ],
      ),
    );
  }

}