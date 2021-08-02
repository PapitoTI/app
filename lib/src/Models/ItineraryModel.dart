import 'package:app/src/Models/SpotModel.dart';
import 'package:flutter/material.dart';

class ItineraryModel {
  String name;
  List<SpotModel> spotsList;
  List<TimeOfDay> spotDuration;
  TimeOfDay totalDuration;
  String description;
  String category;
  List<DateTime> weekdays;
  List<String> itineraryImagesList;
  List<ItineraryAdds> itineraryAddsList;
  int price;

  ItineraryModel(
      {this.name,
      this.spotsList,
      this.spotDuration,
      this.totalDuration,
      this.description,
      this.category,
      this.weekdays,
      this.itineraryImagesList,
      this.itineraryAddsList,
      this.price});
}

class ItineraryAdds {
  String name;
  String description;
  int price;

  ItineraryAdds({this.name, this.description, this.price});
}
