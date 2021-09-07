import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:app/src/Server/local/register_server_connection.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';

import '../credentials.dart';
import '../register_server_connection_interface.dart';

class ServerConnectionBuilder extends ServerConnectionBuilderInterface {
  Future<TouristServerConnection> connectTourist(
      Credentials credentials) async {
    if (credentials.userName == "pedro@gmail.com" &&
        credentials.password == "123") return TouristServerConnection();
    throw Exception("Você digitou a senha errada");
  }

  Future<GuideServerConnection> connectGuide(Credentials credentials) async {
    return GuideServerConnection();
  }

  Future<RegisterServerConnectionInterface> connectRegister() async {
    return RegisterServerConnection();
  }
}
