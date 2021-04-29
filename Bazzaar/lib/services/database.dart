import 'package:Bazzaar/models/produto.dart';

class Database{

  final List<Produto> _data = [
    Produto.fromMap({
      "nome": "Camisa branca",
      "descricao": "",
      "categoria": "masc",
      "obs": "Disponível em todos os tamanhos",
      "off": 10,
      "id": 1,
      "price": 100.0,
      "image_source": "images/"
    }),
    Produto.fromMap({
      "nome": "Camisa branca 2",
      "descricao": "",
      "categoria": "juv",
      "obs": "Disponível em todos os tamanhos",
      "off": 0,
      "id": 1,
      "price": 120.0,
      "image_source": "images/"
    }),
    Produto.fromMap({
      "nome": "Camisa branca 3",
      "descricao": "",
      "categoria": "fem",
      "obs": "Disponível em todos os tamanhos",
      "off": 15,
      "id": 1,
      "price": 200.0,
      "image_source": "images/"
    })
  ];

  Future<List<Produto>> getProdutos(){ 
    return Future.delayed(
      Duration(seconds: 2),
      () => _data
    );
  }

  Future<List<Produto>> getProdutosFilteredByName(String filter) async{
    List<Produto> result = [];
    (await getProdutos()).forEach((produto) {
      if(produto.nome.toLowerCase() == filter.toLowerCase()) result.add(produto);
    });
    return Future.delayed(
      Duration(seconds: 2),
      () => result,
    );
  }

  Future<List<Produto>> getProdutosFilteredByCategoria(String filter) async{
    List<Produto> result = [];
    (await getProdutos()).forEach((produto) {
      if(produto.categoria.toLowerCase() == filter.toLowerCase()) result.add(produto);
    });
    return Future.delayed(
      Duration(seconds: 2),
      () => result,
    );
  }

}