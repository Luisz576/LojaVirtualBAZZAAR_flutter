class Produto{

  String nome, descricao, categoria, obs, imageSource;
  int off, id;
  double price;

  Produto.fromMap(Map map){
    nome = map['nome'];
    descricao = map['descricao'];
    categoria = map['categoria'];
    obs = map['obs'];
    imageSource =  map['image_source'];
    off = map['off'];
    id = map['id'];
    price = map['price'];
  }
  
}