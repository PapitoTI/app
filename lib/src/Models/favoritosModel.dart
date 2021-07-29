class FavoritosModel {
  String local;
  String nome;
  String img;
  String tipo;

  FavoritosModel(this.local, this.nome, this.img, this.tipo);
}

List<FavoritosModel> favoritos = favoritosDB
    .map((item) =>
        FavoritosModel(item['local'], item['nome'], item['img'], item['tipo']))
    .toList();

var favoritosDB = [
  {
    "local": "São Paulo",
    "nome": "Bertioga",
    "img":
        "http://naturam.com.br/wp-content/uploads/2019/10/bertioga-destacada.jpg",
    "tipo": "Praia"
  },
  {
    "local": "Rio de Janeiro, RJ",
    "nome": "Local 2",
    "img":
        "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    "tipo": "Praia"
  },
  {
    "local": "Salvador, BH",
    "nome": "Local 3",
    "img":
        "https://images.unsplash.com/photo-1574003976847-b25af2a95833?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
    "tipo": "Praia"
  },
];
