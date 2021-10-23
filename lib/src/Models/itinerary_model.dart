import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:flutter/material.dart';

enum ItineraryType { SelfGuide, Guide, Host }

class ItineraryModel {
  GuideModel guideModel;
  String name;
  List<SpotModel> spotsList;
  List<Duration> spotDuration;
  List<ItinerarySession> sessionsList;
  String description;
  String category;
  List<bool> weekdays;
  List<ExtraSpot> itineraryAddsList;
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

  clone() => ItineraryModel(
      guideModel,
      name,
      spotsList,
      spotDuration,
      sessionsList,
      description,
      category,
      weekdays,
      itineraryAddsList,
      price,
      itineraryType);
}

class ItinerarySession {
  TimeOfDay start;

  ItinerarySession(this.start);
}

class ExtraSpot {
  String name;
  String description;
  double price;

  ExtraSpot(this.name, this.description, this.price);
}
