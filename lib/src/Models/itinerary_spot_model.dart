import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/spot_model.dart';

class ItinerarySpotModel {
  ItineraryModel itinerary;
  SpotModel spot;
  DateTime time;

  ItinerarySpotModel(this.itinerary, this.spot, this.time);
}
