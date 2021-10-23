import 'dart:core';
import 'dart:io';

import 'package:app/src/Config/mock.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:flutter/material.dart';

class GuideServerConnection extends GuideServerConnectionInterface {
  // retornar dados do guia
  @override
  Future<GuideModel> getGuideData() async {
    GuideModel guideModel = GuideModel(
        'assets/images/felipe_guia.jpg',
        'Guia Ferreira de Souza',
        'fefsouza10@gmail.com',
        '+5511968638792',
        'assets/images/certificado.jpg',
        '100,00');

    return guideModel;
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

  // criar roteiro
  @override
  Future<void> createItinerary(ItineraryModel itineraryModel) async {
    guideItinerariesList.add(itineraryModel);
  }

  //editar roteiro do guia
  @override
  Future<void> updateItinerary(
      String oldName, ItineraryModel itineraryModel) async {
    guideItinerariesList.removeWhere((element) => element.name == oldName);
    guideItinerariesList.add(itineraryModel);
  }

  // retornar lista de roteiros do guia
  @override
  Future<List<ItineraryModel>> getGuideItineraries() async {
    return guideItinerariesList.map((e) => e.clone()).toList();
  }

  // deletar roteiro do guia
  @override
  Future<void> deleteItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  // retornar lista de agendamentos do guia
  @override
  Future<List<ScheduleModel>> getSchedules() async {
    return scheduleList;
  }

  // aprovar o agendamento
  @override
  Future<void> approveSchedule(ScheduleModel scheduleModel) async {
    scheduleModel.scheduleStatus = ScheduleStatus.approved;
  }

  // cancelar o agendamento
  @override
  Future<void> cancelSchedule(ScheduleModel scheduleModel) async {
    scheduleModel.scheduleStatus = ScheduleStatus.denied;
  }
}
