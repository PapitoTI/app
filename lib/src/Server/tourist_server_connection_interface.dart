import 'package:app/src/Models/favoritos_model.dart';
import 'package:app/src/Models/guide_model.dart';

abstract class TouristServerConnectionInterface {
  Future<List<FavoritosModel>> getFavorites() { throw UnsupportedError(""); }
  Future<void> setFavorites(List<FavoritosModel> list) { throw UnsupportedError(""); }
  Future<List<GuideModel>> searchGuides() { throw UnsupportedError(""); }
  Future<List<String>> getTags() { throw UnsupportedError(""); }
}


