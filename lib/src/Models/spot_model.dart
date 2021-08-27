class SpotModel {
  String name;
  String category;
  String description;
  List<String> spotImagesList;
  bool isFavorite;

  SpotModel(this.name, this.category, this.description, this.spotImagesList,
      this.isFavorite);
}

List<SpotModel> spotsList = spotsDB
    .map((item) => SpotModel(
        item['name'].toString(),
        item['category'].toString(),
        item['description'].toString(),
        item['spotImagesList'] as List<String>,
        item['isFavorite'] as bool))
    .toList();

var spotsDB = [
  {
    'name': 'Torre Eiffel',
    'category': 'Monumento',
    'description':
        'A Torre Eiffel bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
    'spotImagesList': [
      'https://jpimg.com.br/uploads/2021/02/eiffel-tower-3349075_1920-1024x682.jpg',
      'https://cdn2.civitatis.com/francia/paris/galeria/header/torre-eiffel-primavera.jpg',
      'https://s2.glbimg.com/FMg0m_W4Zb76bYy2oXTIGI7zb-4=/smart/e.glbimg.com/og/ed/f/original/2019/05/24/60485078_2144726185768804_8588803498087282106_n.jpg'
    ]
  }
];
