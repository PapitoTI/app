import 'package:app/src/Models/spot_model.dart';
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
  double stars;

  ItineraryModel(
      this.name,
      this.spotsList,
      this.spotDuration,
      this.totalDuration,
      this.description,
      this.category,
      this.weekdays,
      this.itineraryImagesList,
      this.itineraryAddsList,
      this.price,
      this.stars);
}

class ItineraryAdds {
  String name;
  String description;
  int price;

  ItineraryAdds(this.name, this.description, this.price);
}

List<ItineraryModel> itineraryList = itineraryDB
    .map((item) => ItineraryModel(
        item['name'].toString(),
        item['spotsList'] as List<SpotModel>,
        item['spotDuration'] as List<TimeOfDay>,
        item['totalDuration'] as TimeOfDay,
        item['description'].toString(),
        item['category'].toString(),
        item['weekdays'] as List<DateTime>,
        item['itineraryImagesList'] as List<String>,
        item['itineraryAddsList'] as List<ItineraryAdds>,
        item['price'] as int,
        item['stars'] as double))
    .toList();

ItineraryModel itinerary = itineraryDB as ItineraryModel;

var itineraryDB = [
  {
    'name': 'Roteiro A',
    'spotsList': spotsList,
    'spotsDuration': [
      TimeOfDay(hour: 04, minute: 00),
    ],
    'totalDuration': TimeOfDay(hour: 04, minute: 00),
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
