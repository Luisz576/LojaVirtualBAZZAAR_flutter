import 'package:Bazzaar/models/produto.dart';
import 'package:Bazzaar/services/database.dart';
import 'package:Bazzaar/utils/animationBuilderProdutos.dart';
import 'package:flutter/material.dart';

class BuscaScreen extends StatefulWidget {

  final filter;
  final bool isCategoria;

  BuscaScreen({@required this.filter, @required this.isCategoria});

  @override
  _BuscaScreenState createState() => _BuscaScreenState(filter, isCategoria);
  
}

class _BuscaScreenState extends State<BuscaScreen>
    with SingleTickerProviderStateMixin {

  AnimationController animationController;

  final filter;
  final bool isCategoria;
  final Database database = Database();

  _BuscaScreenState(this.filter, this.isCategoria);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isCategoria ? "Categoria" : "Busca",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromRGBO(240, 208, 41, 1.0),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(isCategoria ? filter.title : filter,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<List<Produto>>(
              future: isCategoria ? database.getProdutosFilteredByCategoria(filter.categoryName) : database.getProdutosFilteredByName(filter),
              builder: (context, snapshot){
                if(snapshot.hasData && !snapshot.hasError){
                  if(snapshot.data.length > 0){
                    animationController.forward();
                    return AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return animationBuilderProdutos(context, snapshot.data, animationController, false);
                      },
                    );
                  }else
                    return const Text("Nenhum resultado foi encontrado!");
                }else if(snapshot.hasError)
                  return const Text("Não foi possível carregar os produtos!");
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}