import 'package:Bazzaar/models/produto.dart';

class Database{

  final List<Produto> _data = [
    Produto.fromMap({
      "nome": "Camisa branca",
      "descricao": "100% seda\n101% de conforto",
      "categoria": "masc",
      "obs": "Disponível em todos os tamanhos",
      "off": 10,
      "id": 1,
      "price": 100.0,
      "image_source": "images/roupa-branca.jpg"
    }),
    Produto.fromMap({
      "nome": "Camisa branca 2",
      "descricao": "100% seda\n101% de conforto",
      "categoria": "juv",
      "obs": "Disponível em todos os tamanhos",
      "off": 0,
      "id": 1,
      "price": 120.0,
      "image_source": "images/roupa-branca.jpg"
    }),
    Produto.fromMap({
      "nome": "Camisa branca 3",
      "descricao": "100% seda\n101% de conforto",
      "categoria": "fem",
      "obs": "Disponível em todos os tamanhos",
      "off": 15,
      "id": 1,
      "price": 200.0,
      "image_source": "images/roupa-branca-fem.jpg"
    }),
    Produto.fromMap({
      "nome": "Camisa branca 4",
      "descricao": "100% seda\n101% de conforto",
      "categoria": "fem",
      "obs": "Disponível em todos os tamanhos",
      "off": 30,
      "id": 1,
      "price": 350.0,
      "image_source": "images/roupa-branca-fem.jpg"
    }),
    Produto.fromMap({
      "nome": "Camisa branca 5",
      "descricao": "100% seda\n101% de conforto",
      "categoria": "fem",
      "obs": "Disponível em todos os tamanhos",
      "off": 20,
      "id": 1,
      "price": 140.0,
      "image_source": "images/roupa-branca-fem.jpg"
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
      if(produto.nome.toLowerCase().contains(filter.toLowerCase())) result.add(produto);
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