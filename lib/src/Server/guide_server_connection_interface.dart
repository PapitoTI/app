import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/itinerary_spot_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';

abstract class GuideServerConnectionInterface {
  Future<void> createGuide(GuideModel guideModel) async {
    throw UnsupportedError("");
  }

  Future<GuideModel> getGuideData() async {
    throw UnsupportedError("");
  }

  Future<void> updateGuideData() async {
    throw UnsupportedError("");
  }

  Future<void> createSpot(SpotModel spotModel) async {
    throw UnsupportedError("");
  }

  Future<void> createItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  Future<ItineraryModel> getItineraryData() async {
    throw UnsupportedError("");
  }

  Future<List<ItineraryModel>> getGuideItineraries() async {
    throw UnsupportedError("");
  }

  Future<void> createItinerarySpot(
      ItinerarySpotModel itinerarySpotModel) async {
    throw UnsupportedError("");
  }

  Future<List<ItinerarySpotModel>> getItinerarySpots() async {
    throw UnsupportedError("");
  }

  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  Future<void> setScheduleApprovation() async {
    throw UnsupportedError("");
  }
}
