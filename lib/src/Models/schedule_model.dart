import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/tourist_model.dart';

enum ScheduleStatus { pending, denied, approved }

class ScheduleModel {
  ItineraryModel itinerary;
  TouristModel touristModel;
  DateTime date;
  ScheduleStatus scheduleStatus;

  ScheduleModel(
      this.itinerary, this.touristModel, this.date, this.scheduleStatus);

  ScheduleModel clone() => ScheduleModel(
      this.itinerary, this.touristModel, this.date, this.scheduleStatus);
}
