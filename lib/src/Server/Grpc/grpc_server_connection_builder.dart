import 'package:grpc/grpc.dart';
import 'package:app/src/Generated/tourist.pbgrpc.dart';

import 'grpc_tourist_server_connection.dart';

import '../guide_server_connection_interface.dart';
import '../credentials.dart';
import '../server_connection_builder_interface.dart';
import '../tourist_server_connection_interface.dart';

class GrpcServerConnectionBuilder extends ServerConnectionBuilderInterface {

  @override
  Future<TouristServerConnectionInterface> connectTourist(Credentials credentials) async {
    var channel = ClientChannel(
        "192.168.0.2",
        port: 50051,
        options: ChannelOptions(credentials: ChannelCredentials.insecure())
    );
    var client = TouristServiceClient(channel);
    var res = await client.login(LoginRequest(userName: credentials.userName, password: credentials.password));
    if (res.status != 0)
      throw Exception("");
    return GrpcTouristServerConnection(channel, client, credentials.userName, res.cookie);
  }

  @override
  Future<GuideServerConnectionInterface> connectGuide(Credentials credentials) async {
    throw UnimplementedError("");
  }

}

