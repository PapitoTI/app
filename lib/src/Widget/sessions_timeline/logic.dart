import 'package:app/src/Config/mock.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:get/get.dart';

class SessionsTimelineLogic extends GetxController {
  List<ItinerarySession> sessionList = sessionsList;

  void insertSpotsList(List<ItinerarySession> list) {
    sessionList = list;
    update();
  }
}
