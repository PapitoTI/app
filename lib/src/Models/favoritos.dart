class FavoritosModel {
  String nome;
  String img;
  String tipo;

  FavoritosModel(this.nome, this.img, this.tipo);
}

List<FavoritosModel> favoritos = favoritosDB
    .map((item) => FavoritosModel(item['nome'], item['img'], item['tipo']))
    .toList();

var favoritosDB = [
  {
    "nome": "São Paulo, SP",
    "img":
        "https://images.unsplash.com/photo-1544618866-7a1a926891a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=401&q=80",
    "tipo": "Praia"
  },
  {
    "nome": "Rio de Janeiro, RJ",
    "img":
        "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    "tipo": "Praia"
  },
  {
    "nome": "Bahia, BH",
    "img":
        "https://images.unsplash.com/photo-1574003976847-b25af2a95833?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
    "tipo": "Praia"
  },
];
