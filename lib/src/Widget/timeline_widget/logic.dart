import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:get/get.dart';

class TimelineWidgetLogic extends GetxController {
  List<SpotModel> spotsList = spotList;

  void insertSpotsList(List<SpotModel> list) {
    spotsList = list;
    update();
  }
}
