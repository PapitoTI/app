import 'package:app/src/Generated/Protos/register.pbgrpc.dart';
import 'package:grpc/grpc.dart';

import '../register_server_connection_interface.dart';

class GrpcRegisterServerConnection extends RegisterServerConnectionInterface {
  final RegisterServiceClient _client;
  final CallOptions _callOptions;

  GrpcRegisterServerConnection(this._client)
      : _callOptions = CallOptions(timeout: Duration(seconds: 450));

  @override
  Future<int> registerTourist(
      String email, String password, String name, String phone) async {
    await _client.registerTourist(
        RegisterTouristRequest(
            email: email, password: password, name: name, phone: phone),
        options: _callOptions);
    return 0;
  }

  @override
  Future<int> registerGuide(String email, String password, String name,
      String phone, String certificate) async {
    await _client.registerGuide(
        RegisterGuideRequest(
            email: email,
            password: password,
            name: name,
            phone: phone,
            certificate: certificate),
        options: _callOptions);
    return 0;
  }
}
