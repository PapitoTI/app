//import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilGController extends GetxController {
  var counter = 0.obs;

  void increaseCounter() {
    counter.value += 1;
  }
}
