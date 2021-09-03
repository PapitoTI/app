import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/itinerary_spot_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';

import '../guide_server_connection_interface.dart';

class GuideServerConnection extends GuideServerConnectionInterface {
  @override
  Future<void> createGuide(GuideModel guideModel) async {
    throw UnsupportedError("");
  }

  @override
  Future<GuideModel> getGuideData() async {
    throw UnsupportedError("");
  }

  @override
  Future<void> updateGuideData() async {
    throw UnsupportedError("");
  }

  @override
  Future<void> createSpot(SpotModel spotModel) async {
    throw UnsupportedError("");
  }

  @override
  Future<void> createItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  @override
  Future<ItineraryModel> getItineraryData() async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ItineraryModel>> getGuideItineraries() async {
    throw UnsupportedError("");
  }

  @override
  Future<void> createItinerarySpot(
      ItinerarySpotModel itinerarySpotModel) async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ItinerarySpotModel>> getItinerarySpots() async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  @override
  Future<void> setScheduleApprovation() async {
    throw UnsupportedError("");
  }
}
