import 'package:app/src/Pages/Chat/chatController.dart';
import 'package:app/src/Pages/Dashboard/dashboardController.dart';
import 'package:app/src/Pages/Home/homeGController.dart';
import 'package:app/src/Pages/Perfil/perfilGController.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<PerfilGController>(() => PerfilGController());
  }
}
