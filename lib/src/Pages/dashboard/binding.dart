import 'package:app/src/Pages/chat/logic.dart';
import 'package:app/src/Pages/guide_home/logic.dart';
import 'package:app/src/Pages/profile_g/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardLogic());
    Get.lazyPut<DashboardLogic>(() => DashboardLogic());
    Get.lazyPut<GuideHomeLogic>(() => GuideHomeLogic());
    Get.lazyPut<ChatLogic>(() => ChatLogic());
    Get.lazyPut<ProfileGLogic>(() => ProfileGLogic());
  }
}
