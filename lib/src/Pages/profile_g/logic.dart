import 'package:get/get.dart';

import 'state.dart';

class ProfileGLogic extends GetxController {
  final state = ProfileGState();

  var counter = 0.obs;

  void increaseCounter() {
    counter.value += 1;
  }
}
