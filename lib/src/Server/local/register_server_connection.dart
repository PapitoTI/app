import 'package:app/src/Config/mock.dart';
import 'package:app/src/Pages/login/login_controller.dart';
import 'package:app/src/Server/register_server_connection_interface.dart';
import 'package:get/get.dart';

class RegisterServerConnection extends RegisterServerConnectionInterface {
  final LoginController loginController = Get.find<LoginController>();

  Future<void> registerTourist(
      String email, String password, String name) async {
    touristRegister.email = email;
    touristRegister.password = password;
    loginController.loginTUser(
        touristRegister.email.toString(), touristRegister.password.toString());
  }

  Future<int> registerGuide(String email, String password, String name,
      String phone, String certificate) async {
    try {
      print("certp");
    } catch (e) {
      print("certp");
    }
    return 0;
  }
}
