import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:get/get.dart';

class TouristHomeLogic extends GetxController {
  final TouristServerConnectionInterface builder;

  TouristHomeLogic(this.builder);

  Future<TouristModel> getTouristData() async {
    var result = await builder.getTouristData();
    return result;
  }

  Future<List<SpotModel>> getSpots() async {
    var result = await builder.getSpots();
    return result;
  }

  Future<List<ItineraryModel>> getItinerariesByType(itineraryType) async {
    var result = await builder.getItinerariesByType(itineraryType);
    return result;
  }
}
