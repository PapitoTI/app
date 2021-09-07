import 'package:app/src/Server/local/server_connection_builder.dart';
import 'package:app/src/application/login_controller.dart';
import 'package:get/get.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(ServerConnectionBuilder()));
  }
}
