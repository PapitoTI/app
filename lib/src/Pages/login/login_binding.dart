import 'package:app/src/Server/local/server_connection_builder.dart';
import 'package:app/src/Pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(ServerConnectionBuilder()));
  }
}
