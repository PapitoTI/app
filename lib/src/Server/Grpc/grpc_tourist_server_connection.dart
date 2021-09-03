import 'package:grpc/grpc.dart';

import '../tourist_server_connection_interface.dart';
import 'package:app/src/Models/favoritos_model.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Generated/tourist.pbgrpc.dart';

class GrpcTouristServerConnection extends TouristServerConnectionInterface {
  final TouristServiceClient _client;
  final CallOptions _callOptions;

  GrpcTouristServerConnection(this._client, userName, cookie) :
    _callOptions = CallOptions(metadata: { "userName": userName, "cookie": cookie }, timeout: Duration(seconds: 5));

  @override
  Future<List<FavoritosModel>> getFavorites() async {
    _client.favorites(FavoriteRequest(), options: _callOptions);
    return List<FavoritosModel>.empty();
  }
  @override
  Future<void> setFavorites(List<FavoritosModel> list) async { throw UnsupportedError(""); }
  @override
  Future<List<GuideModel>> searchGuides() async { throw UnsupportedError(""); }
  @override
  Future<List<String>> getTags() async { throw UnsupportedError(""); }
}
