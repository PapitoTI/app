import 'package:app/src/Models/itinerary_model.dart';

class ScheduleModel {
  ItineraryModel itinerary;
  DateTime date;
  String status;

  ScheduleModel(this.itinerary, this.date, this.status);
}

List<ScheduleModel> scheduleList = scheduleDB
    .map((item) => ScheduleModel(item['itinerary'] as ItineraryModel,
        item['date'] as DateTime, item['status'].toString()))
    .toList();

var scheduleDB = [
  {
    'itinerary': itinerary,
    'date': DateTime.utc(2021, 08, 10),
    'status': 'Agendado'
  }
];
