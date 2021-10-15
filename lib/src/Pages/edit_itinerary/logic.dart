import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:get/get.dart';

class EditItineraryLogic extends GetxController {
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();
  final ItineraryLogic itineraryLogic = Get.find<ItineraryLogic>();
  ItineraryModel itinerary;

  EditItineraryLogic(this.itinerary);

  void editItinerary(ItineraryModel itineraryModel) {
    itinerary = itineraryModel;
    update();
  }

  // Future<void> updateItinerary() async {
  //   var result = await
  // }

  Future<void> saveItinerary(
      String itineraryName,
      String itineraryDescription,
      List<bool> itineraryWeekdays,
      var itineraryPrice,
      List<Duration> itineraryDuration) async {
    itinerary.name = itineraryName;
    itinerary.description = itineraryDescription;
    itinerary.weekdays = itineraryWeekdays;
    itinerary.price = itineraryPrice;
    itinerary.spotDuration = itineraryDuration;
    itineraryLogic.insertItinerary(itinerary);
    await homeBaseLogic.session.updateItinerary(itinerary);
    homeBaseLogic.update();
    Get.back();
  }

  void updateWeekdaySelector(day) {
    final index = day % 7;
    itinerary.weekdays[index] = !itinerary.weekdays[index];
    update();
  }

  void updateSpotsDuration(List<Duration> list) {
    itinerary.spotDuration = list;
    update();
  }
}
