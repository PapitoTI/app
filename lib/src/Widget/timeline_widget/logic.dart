import 'package:app/src/Config/mock.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:get/get.dart';

class TimelineWidgetLogic extends GetxController {
  List<SpotModel> spotsList = spotList;

  void insertSpotsList(List<SpotModel> list) {
    spotsList = list;
    update();
  }
}
