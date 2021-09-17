import 'package:app/src/Server/register_server_connection_interface.dart';

class RegisterServerConnection extends RegisterServerConnectionInterface {
  Future<int> registerTourist(
      String email, String password, String name, String phone) async {
    throw UnsupportedError("");
  }

  Future<int> registerGuide(String email, String password, String name,
      String phone, String certificate) async {
    print("certp");
    return 0;
  }
}
