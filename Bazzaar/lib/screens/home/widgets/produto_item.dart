import 'package:Bazzaar/models/produto.dart';
import 'package:Bazzaar/screens/home/widgets/button_comprar.dart';
import 'package:flutter/material.dart';

class ProdutoItem extends StatelessWidget {

  final Produto produto;
  final bool isRight;
  final AnimationController controller;
  final double imageHeight;
  final double imageWidth;
  final double marginLeftOrRightCard;
  final double marginButton;

  ProdutoItem({@required this.produto, @required this.isRight, @required this.controller, this.imageHeight = 225, this.imageWidth = 200, this.marginLeftOrRightCard, this.marginButton = 50,}) : 
  animationOpen = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutQuint
    )
  );

  final Animation<double> animationOpen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Stack(
        children: [
          Align(
            alignment: isRight ? Alignment.topRight : Alignment.topLeft,
            child: Card(
              elevation: 10,
              margin: isRight ? EdgeInsets.only(right: 20, top: 10) : EdgeInsets.only(left: 10, top: 10),
              child: Image.asset(produto.imageSource,
                fit: BoxFit.cover,
                width: imageWidth,
                height: imageHeight,
              ),
            ),
          ),
          produto.off > 0 ?
          Align(
            alignment: isRight ? Alignment.topRight : Alignment.topLeft,
            child: Card(
              color: Color.fromRGBO(193, 82, 51, 1.0),
              margin: isRight ? EdgeInsets.only(right: 10) : EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14 * animationOpen.value, vertical: 7 * animationOpen.value),
                child: Text(produto.off.toString() + "%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24 * animationOpen.value,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ) : Container(),
          Stack(
            alignment: isRight ? Alignment.bottomLeft : Alignment.bottomRight,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: marginButton / 2),
                child: Card(
                  margin: isRight ? EdgeInsets.only(left: marginLeftOrRightCard * (1 - animationOpen.value), top: 20) : EdgeInsets.only(left: marginLeftOrRightCard * animationOpen.value, top: 20),
                  elevation: 20,
                  color: Colors.white,
                  child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(produto.nome,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 10,),
                      produto.off > 0 ?
                      Text("R\$" + produto.price.toString().replaceAll('.', ","),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                      : Container(),
                      Text("R\$" + produto.getNewPrice().toString().replaceAll('.', ","),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(produto.descricao,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(produto.obs, 
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: marginButton / 2,
                      ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: isRight ? EdgeInsets.only(left: 13.5 + (marginLeftOrRightCard * (1 - animationOpen.value))) : EdgeInsets.only(right: 8.5),
                child: ButtonComprar(),
              )
            ],
          ),
        ],
      ),
    );
  }
}