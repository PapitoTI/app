import 'package:get/get.dart';

import 'state.dart';

class HomeBaseLogic extends GetxController {
  final state = HomeBaseState();

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
