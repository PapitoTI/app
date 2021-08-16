import 'package:app/src/Server/Grpc/grpc_server_connection_builder.dart';
import 'package:app/src/Server/credentials.dart';
import 'dart:developer';

void main() async {
  try {
    var builder = GrpcServerConnectionBuilder();
    var client = await builder.connectTourist(Credentials("xmicheltelo", "@Sogude4"));
    for (var i in await client.getFavorites())
      print(i);
  }
  catch (e) {
    log(e.toString());
  }
}
