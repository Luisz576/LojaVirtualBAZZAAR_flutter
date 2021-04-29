import 'package:Bazzaar/models/produto.dart';
import 'package:Bazzaar/screens/home/widgets/produto_item.dart';
import 'package:Bazzaar/services/database.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {

  final AnimationController animationController;

  ProductsView(this.animationController);

  @override
  _ProductsViewState createState() => _ProductsViewState(animationController);
}

class _ProductsViewState extends State<ProductsView> {

  final AnimationController animationController;
  Database database = Database();

  _ProductsViewState(this.animationController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Produtos",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline
            ),
          ),
          SizedBox(height: 20,),
          FutureBuilder<List<Produto>>(
            initialData: null,
            future: database.getProdutos(),
            builder: (context, snapshot) {
              int counter = 0;
              if(snapshot.hasData && !snapshot.hasError)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: snapshot.data.map((produto) {
                    if(produto.off > 0){
                      counter++;
                      return ProdutoItem(produto: produto, isRight: (counter % 2 == 0),animation: animationController);
                    }else
                      return Container();
                  }).toList(),
                );
              else if(snapshot.hasError)
                return Text("Não foi possível carregar os produtos!");
              return Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}