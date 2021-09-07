import 'package:app/src/Generated/register.pbgrpc.dart';
import 'package:grpc/grpc.dart';
import '../register_server_connection_interface.dart';

class GrpcRegisterServerConnection extends RegisterServerConnectionInterface {
  final RegisterServiceClient _client;
  final CallOptions _callOptions;

  GrpcRegisterServerConnection(this._client)
      : _callOptions = CallOptions(timeout: Duration(seconds: 5));

  Future<int> registerTourist(
      String email, String password, String name) async {
    var result = await _client.registerTourist(
        RegisterTouristRequest(email: email, password: password, name: name),
        options: _callOptions);
    return result.result;
  }
}
