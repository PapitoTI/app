import 'dart:io';

import 'package:app/src/Config/mock.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:flutter/material.dart';

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
            item['spotImagesList'] as List<String>))
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
    scheduleList.add(scheduleModel);
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
