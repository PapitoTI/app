import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:get/get.dart';

class EditItineraryLogic extends GetxController {
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();
  final ItineraryLogic itineraryLogic = Get.find<ItineraryLogic>();
  ItineraryModel _itinerary;
  ItineraryModel itineraryEditable;

  EditItineraryLogic(this._itinerary) : itineraryEditable = _itinerary.clone();

  Future<void> saveItinerary() async {
    // TODO: insertItinerary dando merda
    itineraryLogic.insertItinerary(itineraryEditable);
    await homeBaseLogic.session
        .updateItinerary(_itinerary.name, itineraryEditable);
    homeBaseLogic.itinerary = itineraryEditable;
    homeBaseLogic.update();
    Get.back();
  }
}
