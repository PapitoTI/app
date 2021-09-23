import 'package:app/src/Models/itinerary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItineraryLogic extends GetxController {
  late ItineraryModel itinerary;
  var totalTime;
  var totalHours = 0.obs;
  var totalMinutes = 0.obs;

  void insertItinerary(ItineraryModel itineraryModel) {
    itinerary = itineraryModel;
    totalTime = totalDuration(itinerary.spotDuration);
    update();
  }

  String totalDuration(List<TimeOfDay> time) {
    for (var i = 0; i > time.length; i++) {
      totalHours += time[i].hour;
    }
    //return '$totalHours:$totalMinutes';
    return totalHours.toString();
  }
}
