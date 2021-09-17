import 'package:app/src/Pages/home_base/view.dart';
import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ServerConnectionBuilderInterface _builder = Get.find(tag: "builder");

  Rx<TouristServerConnectionInterface?> _user =
      Rx<TouristServerConnectionInterface?>(null);

  TouristServerConnectionInterface? get user => _user.value;

  void loginUser(String email, String password) async {
    try {
      _user.value = await _builder.connectTourist(Credentials(email, password));
      Get.to(HomeBasePage());
    } catch (e) {}
  }
}
