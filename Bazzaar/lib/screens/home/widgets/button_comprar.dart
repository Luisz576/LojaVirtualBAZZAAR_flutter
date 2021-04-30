import 'package:Bazzaar/models/produto.dart';
import 'package:Bazzaar/screens/produto/produto_screen.dart';
import 'package:flutter/material.dart';

class ButtonComprar extends StatelessWidget{

  final Produto produto;

  ButtonComprar({@required this.produto});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProdutoScreen(produto: produto),
        ));
      },
      padding: EdgeInsets.zero,
      child: Card(
        color: Color.fromRGBO(193, 82, 51, 1.0),
        margin: EdgeInsets.zero,
        elevation: 20,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Text("COMPRAR",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}