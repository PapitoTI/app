import 'package:app/src/Models/itinerary_model.dart';
import 'package:get/get.dart';

class ItineraryLogic extends GetxController {
  late ItineraryModel itinerary;
  var totalTime;
  var totalHours = 0.obs;
  var totalMinutes = 0.obs;

  void insertItinerary(ItineraryModel itineraryModel) {
    itinerary = itineraryModel;
    update();
  }
}
