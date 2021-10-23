import 'package:app/src/Config/mock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionsTimelineLogic extends GetxController {
  List<TimeOfDay> sessionList = sessionsList;

  void insertSpotsList(List<TimeOfDay> list) {
    sessionList = list;
    update();
  }
}
