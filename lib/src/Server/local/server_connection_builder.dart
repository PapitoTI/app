import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';

import '../credentials.dart';

class ServerConnectionBuilder {
  Future<TouristServerConnection> connectTourist(
      Credentials credentials) async {
    return TouristServerConnection();
  }

  Future<GuideServerConnection> connectGuide(Credentials credentials) async {
    return GuideServerConnection();
  }
}
