import 'package:app/src/Generated/register.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import 'package:app/src/Generated/tourist.pbgrpc.dart';

import '../register_server_connection_interface.dart';
import 'grpc_register_server_connection.dart';
import 'grpc_tourist_server_connection.dart';

import '../guide_server_connection_interface.dart';
import '../credentials.dart';
import '../server_connection_builder_interface.dart';
import '../tourist_server_connection_interface.dart';

class GrpcServerConnectionBuilder extends ServerConnectionBuilderInterface {
  final ClientChannel _channel;

  GrpcServerConnectionBuilder(String ip, int port) : _channel = ClientChannel(ip, port: port, options: ChannelOptions(credentials: ChannelCredentials.insecure()));

  @override
  Future<TouristServerConnectionInterface> connectTourist(Credentials credentials) async {
    var client = TouristServiceClient(_channel);
    var res = await client.login(LoginRequest(email: credentials.userName, password: credentials.password), options: CallOptions(timeout: Duration(seconds: 3)));
    if (res.result != 0)
      throw Exception("");
    return GrpcTouristServerConnection(client, credentials.userName, res.cookie);
  }

  Future<GuideServerConnectionInterface> connectGuide(Credentials credentials) async {
    throw UnsupportedError("");
  }

  Future<RegisterServerConnectionInterface> connectRegister() async {
    var client = RegisterServiceClient(_channel);
    return GrpcRegisterServerConnection(client);
  }

}

