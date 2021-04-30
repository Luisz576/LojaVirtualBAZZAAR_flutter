import 'package:Bazzaar/models/produto.dart';
import 'package:flutter/material.dart';

class ProdutoScreen extends StatefulWidget {

  final Produto produto;

  ProdutoScreen({@required this.produto});

  @override
  _ProdutoScreenState createState() => _ProdutoScreenState(produto);
}

class _ProdutoScreenState extends State<ProdutoScreen> 
    with SingleTickerProviderStateMixin{

  final Produto produto;
  AnimationController _controller;
  Animation<double> animationOpen;

  _ProdutoScreenState(this.produto);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animationOpen = CurvedAnimation(parent: _controller, curve: Interval(0.1, 1.0, curve: Curves.elasticInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _bodyRender(BuildContext context){

    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Hero(
                  tag: "produto_item_id_${produto.id}",
                  child: Image.asset(produto.imageSource,
                    fit: BoxFit.cover,
                    width: screenSize.width,
                    height: screenSize.height * 0.4,
                  ),
                ),
                produto.off > 0 ? AnimatedBuilder(
                  animation: animationOpen,
                  builder: (context, child) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Card(
                        color: Color.fromRGBO(193, 82, 51, 1.0),
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30 * (animationOpen.value > 0 ? animationOpen.value : 0.0), vertical: 15 * (animationOpen.value > 0 ? animationOpen.value : 0.0)),
                          child: Text(produto.off.toString() + "%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: animationOpen.value > 0 ? 32 * animationOpen.value : 0.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ) : Container(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produto.nome,
                    style: TextStyle(
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10,),
                  produto.off > 0 ?
                  Text("R\$" + produto.price.toString().replaceAll('.', ","),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                  : SizedBox(),
                  Text("R\$" + produto.getNewPrice().toString().replaceAll('.', ","),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(produto.descricao,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80,),
          ],
        ),
        _buildButtonComprarAgora(context, screenSize.width)
      ],
    );
  }

  Widget _buildButtonComprarAgora(BuildContext context, double width){
    return FlatButton(
      minWidth: width,
      padding: EdgeInsets.zero,
      color: Color.fromRGBO(193, 82, 51, 1.0),
      onPressed: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Nenhum sistema de banco implementado!'),
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
      child: AnimatedBuilder(
        animation: animationOpen,
        builder: (context, child) => Padding(
          padding: EdgeInsets.symmetric(vertical: 20 * (animationOpen.value > 0 ? animationOpen.value : 0.0)),
          child: Text("COMPRAR AGORA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24 * (animationOpen.value > 0 ? animationOpen.value : 0.0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromRGBO(240, 208, 41, 1.0),
      ),
      body: _bodyRender(context),
    );
  }
}