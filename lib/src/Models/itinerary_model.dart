import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:flutter/material.dart';

enum ItineraryType { SelfGuide, Guide, Host }

class ItineraryModel {
  GuideModel guideModel;
  String name;
  List<SpotModel> spotsList;
  List<Duration> spotDuration;
  List<TimeOfDay> sessionsList;
  String description;
  String category;
  List<bool> weekdays;
  List<ExtraSpotModel> itineraryAddsList;
  double price;
  ItineraryType itineraryType;

  ItineraryModel(
      this.guideModel,
      this.name,
      this.spotsList,
      this.spotDuration,
      this.sessionsList,
      this.description,
      this.category,
      this.weekdays,
      this.itineraryAddsList,
      this.price,
      this.itineraryType);

  ItineraryModel clone() => ItineraryModel(
      this.guideModel.clone(),
      this.name,
      this.spotsList.map((e) => e.clone()).toList(),
      this
          .spotDuration
          .map((e) => new Duration(milliseconds: e.inMilliseconds))
          .toList(),
      this
          .sessionsList
          .map((e) => new TimeOfDay(hour: e.hour, minute: e.minute))
          .toList(),
      this.description,
      this.category,
      this.weekdays.toList(),
      this.itineraryAddsList,
      // TODO: se der merda, arrumar isso
      this.price,
      this.itineraryType);
}

class ExtraSpotModel {
  String name;
  String description;
  double price;
  ExtraSpotModel(this.name, this.description, this.price);
}
