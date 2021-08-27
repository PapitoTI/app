import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';
import 'package:app/src/Server/server_connection_builder_interface.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';

import '../credentials.dart';

class ServerConnectionBuilder extends ServerConnectionBuilderInterface {
  @override
  Future<TouristServerConnectionInterface> connectTourist(
      Credentials credentials) async {
    return TouristServerConnection();
  }

  @override
  Future<GuideServerConnectionInterface> connectGuide(
      Credentials credentials) async {
    return GuideServerConnection();
  }
}
