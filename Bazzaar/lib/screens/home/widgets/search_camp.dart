import 'package:flutter/material.dart';

class SearchCamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black87,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                maxLength: 26,
                decoration: InputDecoration(
                  hintText: "Buscar",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                  counterText: "",
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Material(
              color: Color.fromRGBO(255, 255, 255, 0.0),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.search,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: (){
                  //TODO: TROCA TELA
                  print("buscar");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}