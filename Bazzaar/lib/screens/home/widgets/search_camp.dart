import 'package:Bazzaar/screens/busca/busca_screen.dart';
import 'package:flutter/material.dart';

class SearchCamp extends StatefulWidget {
  @override
  _SearchCampState createState() => _SearchCampState();
}

class _SearchCampState extends State<SearchCamp> {
  
  final TextEditingController inputController = TextEditingController();

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
                controller: inputController,
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
                  if(inputController.text.trim().isNotEmpty)
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => BuscaScreen(filter: inputController.text.trim(), isCategoria: false,),
                      )
                    );
                  else
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Preencha o campo de busca!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      }
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}