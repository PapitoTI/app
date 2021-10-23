import 'package:app/src/Generated/Protos/common.pb.dart';
import 'package:app/src/Generated/Protos/guide.pbgrpc.dart';
import 'package:app/src/Generated/Protos/register.pbgrpc.dart';
import 'package:app/src/Generated/Protos/tourist.pbgrpc.dart';
import 'package:grpc/grpc.dart';

import '../credentials.dart';
import '../guide_server_connection_interface.dart';
import '../register_server_connection_interface.dart';
import '../server_connection_builder_interface.dart';
import '../tourist_server_connection_interface.dart';
import 'grpc_guide_server_connection.dart';
import 'grpc_register_server_connection.dart';
import 'grpc_tourist_server_connection.dart';

class GrpcServerConnectionBuilder extends ServerConnectionBuilderInterface {
  final ClientChannel _channel;

  GrpcServerConnectionBuilder(String ip, int port)
      : _channel = ClientChannel(ip,
            port: port,
            options:
                ChannelOptions(credentials: ChannelCredentials.insecure()));

  @override
  Future<TouristServerConnectionInterface> connectTourist(
      Credentials credentials) async {
    var client = TouristServiceClient(_channel);
    var res = await client.login(
        LoginRequest(email: credentials.email, password: credentials.password),
        options: CallOptions(timeout: Duration(seconds: 3)));
    return GrpcTouristServerConnection(client, credentials.email, res.cookie);
  }

  @override
  Future<GuideServerConnectionInterface> connectGuide(
      Credentials credentials) async {
    var client = GuideServiceClient(_channel);
    var res = await client.login(
        LoginRequest(email: credentials.email, password: credentials.password),
        options: CallOptions(timeout: Duration(seconds: 3)));
    return GrpcGuideServerConnection(client, credentials.email, res.cookie);
  }

  @override
  Future<RegisterServerConnectionInterface> connectRegister() async {
    var client = RegisterServiceClient(_channel);
    return GrpcRegisterServerConnection(client);
  }
}
