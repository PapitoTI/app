import 'package:app/src/Server/credentials.dart';
import 'package:app/src/Server/register_server_connection_interface.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:app/src/application/root.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ServerConnectionBuilderInterface _builder;

  Rx<RegisterServerConnectionInterface?> _create =
      Rx<RegisterServerConnectionInterface?>(null);

  LoginController(
    this._builder,
  );

  RegisterServerConnectionInterface? get create => _create.value;

  void createUser(String email, String password, String name) async {
    try {} catch (e) {}
  }

  void singOutUser(String email, String password) {
    try {} catch (e) {}
  }
}
