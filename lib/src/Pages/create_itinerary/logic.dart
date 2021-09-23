import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateItineraryLogic extends GetxController {
  ItineraryModel itinerary = ItineraryModel(
      guideModel, '', [], [], '', '', [], [], 0.00, ItineraryType.Guide);

  GuideServerConnection connection = GuideServerConnection();

  void saveItinerary(
      String itineraryName,
      String itineraryDescription,
      String itineraryCategory,
      List<bool> itineraryWeekdays,
      double itineraryPrice,
      List<TimeOfDay> itineraryDuration) {
    ItineraryModel itineraryModel = ItineraryModel(
        guideModel,
        itineraryName,
        spotList,
        spotDuration,
        itineraryDescription,
        itineraryCategory,
        weekdays,
        itineraryAddsList,
        itineraryPrice,
        ItineraryType.Guide);
    connection.createItinerary(itineraryModel);
    update();
  }

  void updateWeekdaySelector(day) {
    final index = day % 7;
    itinerary.weekdays[index] = !itinerary.weekdays[index];
    update();
  }

  void updateSpotsDuration(List<TimeOfDay> list) {
    itinerary.spotDuration = list;
    update();
  }
}
