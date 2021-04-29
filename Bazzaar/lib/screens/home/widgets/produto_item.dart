import 'package:Bazzaar/models/produto.dart';
import 'package:flutter/material.dart';

class ProdutoItem extends StatelessWidget {

  final Produto produto;
  final Animation<double> animation;
  final bool isRight;

  ProdutoItem({@required this.produto, @required this.isRight, @required this.animation});

  @override
  Widget build(BuildContext context) {
    return Text(produto.nome + " " + isRight.toString());
  }
}