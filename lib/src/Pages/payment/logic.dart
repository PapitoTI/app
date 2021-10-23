import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:get/get.dart';

class PaymentLogic extends GetxController {
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();

  Future<void> requestSchedule(
      ItineraryModel itineraryModel,
      TouristModel touristModel,
      DateTime dateTime,
      ScheduleStatus scheduleStatus) async {
    var scheduleModel =
        ScheduleModel(itineraryModel, touristModel, dateTime, scheduleStatus);
    homeBaseLogic.session.requestSchedule(scheduleModel);
    Get.back();
  }
}
