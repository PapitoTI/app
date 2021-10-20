import 'dart:io';

import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:flutter/material.dart';

TouristModel touristModel = TouristModel('assets/images/felipe_turista.jpg',
    'Turista Ferreira de Souza', 'fefsouza10@gmail.com', '+5511968638792');

GuideModel guideModel = GuideModel(
    'assets/images/felipe_guia.jpg',
    'Felipe Ferreira de Souza',
    'fefsouza10@gmail.com',
    '+5511968638792',
    'assets/images/certificado.jpg',
    '100,00'
        '');

SpotModel spotModel1 = SpotModel(
    'MASP',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/masp1.jpg',
      'assets/images/masp2.jpg',
      'assets/images/masp3.jpg'
    ],
    true);

SpotModel spotModel2 = SpotModel(
    'Parque Ibirapuera',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/ibirapuera1.jpg',
      'assets/images/ibirapuera2.jpg',
      'assets/images/ibirapuera3.jpg'
    ],
    true);

SpotModel spotModel3 = SpotModel(
    'Catedral da Sé',
    'Sé, São Paulo',
    'Monumento',
    'A Catedral da Sé é a igreja mais conhecida de São Paulo. Independente da religião a visita é imperdível.Com sua imponente construção marca também o centro da cidade, na Praça da Sé. A sua arquitetura é de brilhar os olhos! Cercada por vitrais, mosaicos e obras de arte sacra, possui capacidade para 8.000 pessoas, sendo considerada a maior da América do Sul.',
    [
      'assets/images/catedralse1.jpg',
      'assets/images/catedralse2.jpg',
      'assets/images/catedralse3.jpg'
    ],
    true);

List<SpotModel> spotList = [spotModel1, spotModel2, spotModel3];

var guidesDB = [
  {
    'imageUrl': 'assets/images/felipe_guia.jpg',
    'name': 'Felipe Ferreira de Souza',
    'email': 'fefsouza10@gmail.com',
    'phone': '+5511968638792',
    'certificate': 'assets/images/certificado.jpg',
    'accountBalance': '100,00'
  }
];

List<Duration> spotDuration = [
  Duration(hours: 2, minutes: 30),
  Duration(hours: 3, minutes: 45),
  Duration(hours: 1, minutes: 15),
];

List<ExtraSpot> itineraryAddsList = [
  ExtraSpot('Serviço X', 'Faça isso e aproveite mais sua viagem!', 45.00),
  ExtraSpot('Serviço Y', 'Faça aquilo e aproveite mais sua viagem!', 20.00)
];

var itinerariesDB = [
  {
    'guideModel': guideModel,
    'name': 'Rolê no MASP',
    'spotsList': spotsDB,
    'spotDuration': spotDuration,
    'description':
        'Este roteiro passa por vários lugares de São Paulo, aproveite!',
    'category': 'Rolê',
    'weekdays': [false, true, true, true, true, true, false],
    'itineraryAddsList': itineraryAddsList,
    'price': 120.00
  }
];

DateTime dateItinerary = DateTime.utc(2021, 10, 22, 10, 00);

ItinerarySession session1 = ItinerarySession(TimeOfDay(hour: 10, minute: 00));
ItinerarySession session2 = ItinerarySession(TimeOfDay(hour: 16, minute: 00));
ItinerarySession session3 = ItinerarySession(TimeOfDay(hour: 21, minute: 00));

List<ItinerarySession> sessionsList = [session1, session2, session3];

ItineraryModel itineraryModel1 = ItineraryModel(
    guideModel,
    'Rolê em SP',
    spotList,
    spotDuration,
    sessionsList,
    'Este roteiro passa por vários lugares de São Paulo, aproveite!',
    'Rolê',
    [false, true, true, true, true, true, false],
    itineraryAddsList,
    300.00,
    ItineraryType.Guide);

ScheduleModel scheduleModel1 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel2 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel3 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel4 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.pending);
ScheduleModel scheduleModel5 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.pending);

List<ScheduleModel> scheduleList = [
  scheduleModel1,
  scheduleModel2,
  scheduleModel3,
  scheduleModel4,
  scheduleModel5
];

List<ItineraryModel> guideItinerariesList = [itineraryModel1];

var spotsDB = [
  {
    'name': 'MASP',
    'address': 'Avenida Paulista, São Paulo',
    'category': 'Monumento',
    'description':
        'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    'spotImagesList': [
      'assets/images/masp1.jpg',
      'assets/images/masp2.jpg',
      'assets/images/masp3.jpg',
    ],
    'isFavorite': true,
  },
  {
    'name': 'Parque Ibirapuera',
    'address': 'Moema, São Paulo',
    'category': 'Parque',
    'description':
        'O Parque Ibirapuera é um parque urbano localizado na cidade de São Paulo, Brasil. Em 2017, foi o parque mais visitado da América Latina, com aproximadamente 14 milhões de visitas,[1] além de ser um dos locais mais fotografados do mundo.Inaugurado em 1954 com uma área de 158 hectares (390 acres), entre as avenidas Pedro Álvares Cabral, República do Líbano e IV Centenário, o Parque Ibirapuera é um parque tombado e patrimônio histórico de São Paulo. Seus jardins foram desenhados pelo paisagista Otávio Augusto Teixeira Mendes, após o conceito e anteprojeto do paisagista Roberto Burle Marx, a quem foram inicialmente encomendados, encontrarem resistência para sua efetiva realização.[3] Já as construções históricas como os pavilhões que abrigam museus, o auditório, marquise entre outras foram concebidas pelo arquiteto Oscar Niemeyer com projetos estruturais do engenheiro Joaquim Cardozo, e são tombadas pelo Instituto Patrimônio Histórico e Artístico Nacional.[4][5][6][7] O parque como um todo é tombado pelo Conselho Municipal de Preservação do Patrimônio Histórico, Cultural e Ambiental da Cidade de São Paulo e pelo Conselho de Defesa do Patrimônio Histórico, Arqueológico, Artístico e Turístico do Estado de São Paulo.',
    'spotImagesList': [
      'assets/images/ibirapuera1.jpg',
      'assets/images/ibirapuera2.jpg',
      'assets/images/ibirapuera3.jpg',
      'assets/images/ibirapuera4.jpg',
      'assets/images/ibirapuera5.jpg',
    ],
    'isFavorite': true,
  },
  {
    'name': 'Catedral da Sé',
    'address': 'Sé, São Paulo',
    'category': 'Monumento',
    'description':
        'A Catedral da Sé é a igreja mais conhecida de São Paulo. Independente da religião a visita é imperdível.Com sua imponente construção marca também o centro da cidade, na Praça da Sé. A sua arquitetura é de brilhar os olhos! Cercada por vitrais, mosaicos e obras de arte sacra, possui capacidade para 8.000 pessoas, sendo considerada a maior da América do Sul.',
    'spotImagesList': [
      'assets/images/catedralse1.jpg',
      'assets/images/catedralse2.jpg',
      'assets/images/catedralse3.jpg',
    ],
    'isFavorite': true,
  },
  {
    'name': 'Cadillac Burger',
    'address': 'Mooca, São Paulo',
    'category': 'Gastronomia',
    'description':
        'O Cadillac Burger é uma hamburgueria cheia de personalidade que fica à R. Juventus na Mooca e surgiu em 2012.',
    'spotImagesList': [
      'assets/images/cadillacburger1.jpg',
      'assets/images/cadillacburger2.jpg',
      'assets/images/cadillacburger3.jpg',
    ],
    'isFavorite': false,
  },
  {
    'name': 'Bairro Liberdade',
    'address': 'Liberdade, São Paulo',
    'category': 'Cidade',
    'description':
        'O bairro mais japonês da cidade de São Paulo, enlouquece os turistas com o tanto de lojinhas que abriga. Lá você encontra o Museu Histórico da Imigração Japonesa no Brasil, o Bunkyo. Além disso, o bairro tem decoração temática com luminárias japonesas por todo lado. Os karaokês da região também são atrações famosas. Pare em algum e solte a voz! Já os restaurantes são destaques na culinária japonesa, aproveite para deliciar-se. Ah, uma dica é que o Bairro Liberdade é mais animado aos sábados.',
    'spotImagesList': [
      'assets/images/liberdade1.jpg',
      'assets/images/liberdade2.jpg',
      'assets/images/liberdade3.jpg',
    ],
    'isFavorite': false,
  },
  {
    'name': 'Beco do Batman',
    'address': 'Vila Madalena, São Paulo',
    'category': 'Monumento',
    'description':
        'São Paulo também é conhecida pela sua arte de rua, que invade os muros com suas cores e manifestações. Os grafites e pinturas estão por toda a cidade, mas no Beco do Batman há uma concentração maior deles. Se você curte os diferentes traços coloridos que falam por si só, esse é o local perfeito. Ah, o local rende muitas fotos! O Beco do Batman também é famoso pelos botecos que abriga, além de ser um ótimo local para compras descoladas, com muitos brechós e antiquários.',
    'spotImagesList': [
      'assets/images/becobatman1.jpg',
      'assets/images/becobatman2.jpg',
      'assets/images/becobatman3.jpg',
    ],
    'isFavorite': false,
  }
];

var imageUrl1 =
    'https://c4.wallpaperflare.com/wallpaper/500/442/354/outrun-vaporwave-hd-wallpaper-preview.jpg';
var imageUrl2 = 'https://wallpaperaccess.com/full/797185.png';
var imageUrl3 = 'https://wallpaperaccess.com/full/797185.png';
var imageUrl4 =
    'https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg';
var imageUrl5 =
    'showmetech.com.br/wp-content/uploads//2020/12/nebula-4k-1024x576.jpg';

List<String> imagesUrlList = [
  imageUrl1,
  imageUrl2,
  imageUrl3,
  imageUrl4,
  imageUrl5
];

class TouristServerConnection extends TouristServerConnectionInterface {
  Future<TouristModel> getTouristData() async {
    TouristModel touristModel = TouristModel('assets/images/becobatman1.jpg',
        'Turista Ferreira de Souza', 'fefsouza10@gmail.com', '+5511968638792');

    return touristModel;
  }

  @override
  Image getImage(String url) {
    return Image.asset(url);
  }

  // trocar foto de perfil
  @override
  Future<String> updateProfilePicture(File file) async {
    throw UnsupportedError("");
  }

  // trocar senha
  @override
  Future<void> updateProfilePassword(
      String oldPassword, String newPassword) async {
    throw UnsupportedError("");
  }

  // retornar lista dos destinos em alta
  @override
  Future<List<SpotModel>> getSpots() async {
    List<SpotModel> spotsList = spotsDB
        .map((item) => SpotModel(
            item['name'].toString(),
            item['address'].toString(),
            item['category'].toString(),
            item['description'].toString(),
            item['spotImagesList'] as List<String>,
            item['isFavorite'] as bool))
        .toList();

    return spotsList;
  }

  // retornar lista de destinos favoritos
  Future<List<SpotModel>> getFavoriteSpots() async {
    throw UnsupportedError("");
  }

  // retornar lista de roteiros por tipo de guiamento
  @override
  Future<List<ItineraryModel>> getItinerariesByType(itineraryType) async {
    ItineraryModel itineraryModel4841 = ItineraryModel(
        guideModel,
        'Rolê em SP',
        spotList,
        spotDuration,
        sessionsList,
        'Este roteiro passa por vários lugares de São Paulo, aproveite!',
        'Rolê',
        [false, true, true, true, true, true, false],
        itineraryAddsList,
        300.00,
        ItineraryType.Guide);
    List<ItineraryModel> guideItinerary = [itineraryModel4841];

    return guideItinerary;
  }

  // retornar lista de roteiros por guia
  @override
  Future<List<ItineraryModel>> getGuideItineraries(
      GuideModel guideModel) async {
    throw UnsupportedError("");
  }

  // criar novo roteiro
  @override
  Future<void> requestSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  // retonar lista de agendamentos do turista
  @override
  Future<List<ScheduleModel>> getSchedules() async {
    return scheduleList;
  }

  // retornar lista de pesquisa do usuário (destinos e roteiros)
  // retornar ItineraryModel e SpotModel
  @override
  Future<List<Object>> searchResults(
      List<String> categories, String searchText) async {
    throw UnsupportedError("");
  }
}
