import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:flutter/material.dart';

enum ItineraryType { SelfGuide, Guide, Host }

class ItineraryModel {
  GuideModel guideModel;
  String name;
  List<SpotModel> spotsList;
  List<TimeOfDay> spotDuration;
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
      this.description,
      this.category,
      this.weekdays,
      this.itineraryAddsList,
      this.price,
      this.itineraryType);
}

class ExtraSpot {
  String name;
  String description;
  double price;

  ExtraSpot(this.name, this.description, this.price);
}

ItineraryModel itinerary = itineraryDB as ItineraryModel;

var itineraryDB = [
  {
    'name': 'Roteiro A',
    'spotsList': '',
    'spotsDuration': [
      TimeOfDay(hour: 04, minute: 00),
    ],
    'description': 'Descrição do roteiro A bla bla bla bla bla bla',
    'category': 'Histórico',
    'weekdays': [DateTime.monday, DateTime.tuesday, DateTime.wednesday],
    'itineraryImagesList': [
      'https://cdn2.civitatis.com/francia/paris/galeria/header/torre-eiffel-primavera.jpg'
    ],
    'itineraryAddsList': [],
    'price': 250
  }
];
