import 'dart:io';

import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';

abstract class GuideServerConnectionInterface {
  // retornar dados do guia
  Future<GuideModel> getGuideData() async {
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

  // criar roteiro
  Future<void> createItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  // retornar lista de roteiros do guia
  Future<List<ItineraryModel>> getGuideItineraries() async {
    throw UnsupportedError("");
  }

  //editar roteiro do guia
  Future<void> updateItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  // deletar roteiro do guia
  Future<void> deleteItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  // retornar lista de agendamentos do guia
  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  // aprovar o agendamento
  Future<void> approveSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  // cancelar o agendamento
  Future<void> cancelSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }
}
