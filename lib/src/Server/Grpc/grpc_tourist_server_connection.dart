import 'package:grpc/grpc.dart';

import '../tourist_server_connection_interface.dart';
import 'package:app/src/Models/favoritos_model.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Generated/tourist.pbgrpc.dart';

class GrpcTouristServerConnection extends TouristServerConnectionInterface {
  final ClientChannel _channel;
  final TouristServiceClient _client;
  final String _userName;
  final String _cookie;

  GrpcTouristServerConnection(this._channel, this._client, this._userName, this._cookie);

  @override
  Future<List<FavoritosModel>> getFavorites() async {


    return List<FavoritosModel>.empty();
  }
  @override
  Future<void> setFavorites(List<FavoritosModel> list) async { throw UnsupportedError(""); }
  @override
  Future<List<GuideModel>> searchGuides() async { throw UnsupportedError(""); }
  @override
  Future<List<String>> getTags() async { throw UnsupportedError(""); }
}
