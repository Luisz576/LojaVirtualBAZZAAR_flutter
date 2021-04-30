import 'package:flutter/material.dart';

class CartoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("images/cartoes.png",
          fit: BoxFit.fitWidth,
          width: screenSize.width,
          height: screenSize.height * 0.3,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("*Aceitamos os mais diversos tipos de cartões",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}