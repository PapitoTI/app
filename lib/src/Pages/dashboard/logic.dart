import 'package:get/get.dart';

import 'state.dart';

class DashboardLogic extends GetxController {
  final state = DashboardState();

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
