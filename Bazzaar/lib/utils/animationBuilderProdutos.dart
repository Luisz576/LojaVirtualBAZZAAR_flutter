import 'package:Bazzaar/models/produto.dart';
import 'package:Bazzaar/utils/widgets/produto_item.dart';
import 'package:flutter/material.dart';

Widget animationBuilderProdutos(BuildContext context, List<Produto> data, AnimationController animationController, bool onlyPromo){
  final Size screenSize = MediaQuery.of(context).size;
  int counter = 0;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data.map((produto) {
      if(produto.off > 0 || !onlyPromo){
        counter++;
        return ProdutoItem(
          produto: produto,
          controller: animationController.view,
          isRight: (counter % 2 == 0),
          imageHeight: screenSize.height * 0.35,
          imageWidth: screenSize.width * 0.55,
          marginLeftOrRightCard: screenSize.width * 0.35,
        );
      }else
        return Container();
    }).toList(),
  );
}