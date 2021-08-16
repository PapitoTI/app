import 'credentials.dart';
import 'tourist_server_connection_interface.dart';
import 'guide_server_connection_interface.dart';

abstract class ServerConnectionBuilderInterface {
  Future<TouristServerConnectionInterface> connectTourist(Credentials credentials) { throw UnsupportedError(""); }
  Future<GuideServerConnectionInterface> connectGuide(Credentials credentials) { throw UnsupportedError(""); }
}