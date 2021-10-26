import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Pages/add_spots/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeBaseLogic extends GetxController {
  var session;
  var schedules;
  var itinerary;

  HomeBaseLogic(this.session);

  final state = HomeBaseState();
  final ItineraryLogic itineraryLogic = Get.put(ItineraryLogic());
  final AddSpotsLogic addSpotsLogic = Get.put(AddSpotsLogic());

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<List<ScheduleModel>> getSchedulesFromInterface() async {
    schedules = await session.getSchedules();
    return schedules as List<ScheduleModel>;
  }
}
