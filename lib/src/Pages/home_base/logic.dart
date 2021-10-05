import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Pages/add_spots/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Pages/teste_page2/logic.dart';
import 'package:app/src/Widget/search_widget/logic.dart';
import 'package:app/src/Widget/timeline_widget/logic.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeBaseLogic extends GetxController {
  var session;
  var schedules;

  HomeBaseLogic(this.session);

  final state = HomeBaseState();
  final ItineraryLogic itineraryLogic = Get.put(ItineraryLogic());
  final TestePage2Logic testePage2Logic = Get.put(TestePage2Logic());
  final SearchWidgetLogic searchWidgetLogic = Get.put(SearchWidgetLogic());
  final AddSpotsLogic addSpotsLogic = Get.put(AddSpotsLogic());
  final TimelineWidgetLogic timelineWidgetLogic =
      Get.put(TimelineWidgetLogic());

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
