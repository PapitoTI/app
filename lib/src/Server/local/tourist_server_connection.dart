import 'dart:io';

import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';

class TouristServerConnection extends TouristServerConnectionInterface {
  Future<TouristModel> getTouristData() async {
    throw UnsupportedError("");
  }

  // trocar foto de perfil
  Future<void> updateProfilePicture(File file) async {
    throw UnsupportedError("");
  }

  // trocar senha
  Future<void> updateProfilePassword(
      String oldPassword, String newPassword) async {
    throw UnsupportedError("");
  }

  // retornar lista dos destinos em alta
  Future<List<SpotModel>> getSpots() async {
    throw UnsupportedError("");
  }

  // retornar lista de roteiros por tipo de guiamento
  Future<List<ItineraryModel>> getItinerariesByType(
      ItineraryType itineraryType, int index, int length) async {
    throw UnsupportedError("");
  }

  // retornar lista de roteiros por guia
  Future<List<ItineraryModel>> getGuideItineraries(
      GuideModel guideModel) async {
    throw UnsupportedError("");
  }

  // criar novo roteiro
  Future<void> requestSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  // retonar lista de agendamentos do turista
  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  // retornar lista de pesquisa do usuário (destinos e roteiros)
  // retornar ItineraryModel e SpotModel
  Future<List<Object>> searchResults(SearchFilter searchFilter) async {
    throw UnsupportedError("");
  }
}
