import 'package:Bazzaar/models/produto.dart';
import 'package:Bazzaar/services/database.dart';
import 'package:Bazzaar/utils/animationBuilderProdutos.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> 
    with SingleTickerProviderStateMixin{

  Database database = Database();

  AnimationController animationController;

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
    animationController.dispose();
    super.dispose();
  }

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
            builder: (BuildContext context, AsyncSnapshot<List<Produto>> snapshot) {
              if(snapshot.hasData && !snapshot.hasError){
                animationController.forward();
                return AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return animationBuilderProdutos(context, snapshot.data, animationController, true);
                  },
                );
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
    );
  }

}