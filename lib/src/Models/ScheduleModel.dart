import 'package:app/src/Models/ItineraryModel.dart';

class ScheduleModel {
  ItineraryModel itinerary;
  DateTime date;
  String status;

  ScheduleModel({this.itinerary, this.date, this.status});
}