import 'package:app/src/Config/mock.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:get/get.dart';

class CreateItineraryLogic extends GetxController {
  final homeBaseLogic = Get.find<HomeBaseLogic>();

  ItineraryModel itineraryCreatable = ItineraryModel(
      GuideModel('imageUrl', 'name', 'email', 'phone', 'certificate',
          'accountBalance'),
      '',
      spotList,
      spotDuration,
      sessionsList,
      '',
      '',
      [false, false, false, false, false, false, false],
      [],
      200.00,
      ItineraryType.Guide);

  void saveItinerary(ItineraryModel creatableItineraryModel) {
    ItineraryModel itineraryModel = creatableItineraryModel;
    homeBaseLogic.session.createItinerary(itineraryModel);
    homeBaseLogic.update();
    Get.back();
    update();
  }

  void updateWeekdaySelector(day) {
    final index = day % 7;
    itineraryCreatable.weekdays[index] = !itineraryCreatable.weekdays[index];
    update();
  }

  void updateSpotsDuration(List<Duration> list) {
    itineraryCreatable.spotDuration = list;
    update();
  }
}
