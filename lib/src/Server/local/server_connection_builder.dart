import 'package:app/src/Config/mock.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:app/src/Server/local/register_server_connection.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';
import 'package:app/src/Server/register_server_connection_interface.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';

import '../credentials.dart';
import '../register_server_connection_interface.dart';

class ServerConnectionBuilder extends ServerConnectionBuilderInterface {
  Future<TouristServerConnection> connectTourist(
      Credentials credentials) async {
    if (credentials.email == touristRegister.email &&
        credentials.password == touristRegister.password)
      return TouristServerConnection();
    throw Exception("Você digitou a senha errada");
  }

  Future<GuideServerConnection> connectGuide(Credentials credentials) async {
    if (credentials.email == "pedro@gmail.com" &&
        credentials.password == "teste123") return GuideServerConnection();
    throw Exception("Você digitou a senha errada");
  }

  Future<RegisterServerConnectionInterface> connectRegister() async {
    return RegisterServerConnection();
  }
}
