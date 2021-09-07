import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/register_server_connection_interface.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:app/src/application/root.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ServerConnectionBuilderInterface _builder;
  Rx<TouristServerConnectionInterface?> _user =
      Rx<TouristServerConnectionInterface?>(null);
  Rx<RegisterServerConnectionInterface?> _create =
      Rx<RegisterServerConnectionInterface?>(null);

  LoginController(
    this._builder,
  );

  TouristServerConnectionInterface? get user => _user.value;

  RegisterServerConnectionInterface? get create => _create.value;

  void createUser(String email, String password, String name) async {
    try {} catch (e) {}
  }

  void loginUser(String email, String password) async {
    try {
      _user.value = await _builder.connectTourist(Credentials(email, password));
      Get.offAll(LoginRoot);
    } catch (e) {}
  }

  void singOutUser(String email, String password) {
    try {} catch (e) {}
  }
}
