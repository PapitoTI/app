import 'dart:io';

import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:flutter/material.dart';

abstract class TouristServerConnectionInterface {
  Future<TouristModel> getTouristData() async {
    throw UnsupportedError("");
  }

  Image getImage(String url) {
    throw UnsupportedError("");
  }

  // trocar foto de perfil
  Future<String> updateProfilePicture(File file) async {
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
      ItineraryType itineraryType) async {
    throw UnsupportedError("");
  }

  Future<List<ItineraryModel>> getGuideItineraries() async {
    throw UnsupportedError("");
  }

  // reservar roteiro
  Future<void> requestSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  // retonar lista de agendamentos do turista
  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  // retornar lista de pesquisa do usuário (destinos e roteiros)
  // retornar ItineraryModel e SpotModel
  Future<List<Object>> searchResults(
      List<String> categories, String searchText) async {
    throw UnsupportedError("");
  }
}
