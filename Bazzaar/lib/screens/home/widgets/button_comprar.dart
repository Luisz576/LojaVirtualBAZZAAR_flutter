import 'package:flutter/material.dart';

class ButtonComprar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        //TODO: OPEN PAGE
        print("Comprar");
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