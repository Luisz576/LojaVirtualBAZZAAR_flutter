import 'package:Bazzaar/models/category.dart';
import 'package:Bazzaar/screens/busca/busca_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final Category category;
  final double radius;
  final Animation<double> animation;

  CategoryItem({@required this.category, @required this.radius, @required this.animation});

  @override
  Widget build(BuildContext context) {
    return category.image.isNotEmpty ? Padding(
      padding: EdgeInsets.only(right: 20),
      child: Container(
        height: radius * 2,
        width: radius * 2,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => BuscaScreen(filter: category, isCategoria: true,),
                  )
                );
              },
              child: Container(
                height: animation.value * radius,
                width: animation.value * radius,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(category.image),
                    fit: BoxFit.cover
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            animation.value > 1.9 ? Text(category.title) : Container(),
          ],
        ),
      ),
    )
    : Container();
  }

}