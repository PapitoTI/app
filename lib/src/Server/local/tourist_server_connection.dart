import 'dart:io';

import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';

enum ItineraryType { SelfGuide, Guide, Host }

var spotsDB = [
  {
    'name': 'Local 1',
    'address': 'Avenida Paulista',
    'category': 'Monumento',
    'description':
        'A Torre Eiffel bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
    'spotImagesList': [
      'https://jpimg.com.br/uploads/2021/02/eiffel-tower-3349075_1920-1024x682.jpg',
      'https://cdn2.civitatis.com/francia/paris/galeria/header/torre-eiffel-primavera.jpg',
      'https://s2.glbimg.com/FMg0m_W4Zb76bYy2oXTIGI7zb-4=/smart/e.glbimg.com/og/ed/f/original/2019/05/24/60485078_2144726185768804_8588803498087282106_n.jpg'
    ],
    'isFavorite': true,
  },
  {
    'name': 'Local 2',
    'address': 'Avenida Paulista',
    'category': 'Monumento',
    'description':
        'A Torre Eiffel bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
    'spotImagesList': [
      'https://jpimg.com.br/uploads/2021/02/eiffel-tower-3349075_1920-1024x682.jpg',
      'https://cdn2.civitatis.com/francia/paris/galeria/header/torre-eiffel-primavera.jpg',
      'https://s2.glbimg.com/FMg0m_W4Zb76bYy2oXTIGI7zb-4=/smart/e.glbimg.com/og/ed/f/original/2019/05/24/60485078_2144726185768804_8588803498087282106_n.jpg'
    ],
    'isFavorite': true,
  },
  {
    'name': 'Local 3',
    'address': 'Avenida Paulista',
    'category': 'Monumento',
    'description':
        'A Torre Eiffel bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla',
    'spotImagesList': [
      'https://jpimg.com.br/uploads/2021/02/eiffel-tower-3349075_1920-1024x682.jpg',
      'https://cdn2.civitatis.com/francia/paris/galeria/header/torre-eiffel-primavera.jpg',
      'https://s2.glbimg.com/FMg0m_W4Zb76bYy2oXTIGI7zb-4=/smart/e.glbimg.com/og/ed/f/original/2019/05/24/60485078_2144726185768804_8588803498087282106_n.jpg'
    ],
    'isFavorite': true,
  }
];

class SearchFilter {
  List<String> categories;
  String searchText;

  SearchFilter(this.searchText, this.categories);
}

class TouristServerConnection {
  Future<TouristModel> getTouristData() async {
    throw UnsupportedError("");
  }

  // trocar foto de perfil
  @override
  Future<void> updateProfilePicture(File file) async {
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

  // retornar lista de roteiros por tipo de guiamento
  @override
  Future<List<ItineraryModel>> getItinerariesByType(
      ItineraryType itineraryType, int index, int length) async {
    throw UnsupportedError("");
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
    throw UnsupportedError("");
  }

  // retornar lista de pesquisa do usuário (destinos e roteiros)
  // retornar ItineraryModel e SpotModel
  @override
  Future<List<Object>> searchResults(SearchFilter searchFilter) async {
    throw UnsupportedError("");
  }
}
