import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/itinerary_spot_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';

abstract class TouristServerConnectionInterface {
  Future<void> createTourist(TouristModel touristModel) async {
    throw UnsupportedError("");
  }

  Future<TouristModel> getTouristData() async {
    throw UnsupportedError("");
  }

  Future<void> updateTouristData() async {
    throw UnsupportedError("");
  }

  Future<SpotModel> getSpotData() async {
    throw UnsupportedError("");
  }

  Future<List<SpotModel>> getFavorites() async {
    throw UnsupportedError("");
  }

  Future<ItineraryModel> getItineraryData() async {
    throw UnsupportedError("");
  }

  Future<List<ItineraryModel>> getItinerariesByType(type) async {
    throw UnsupportedError("");
  }

  Future<List<ItineraryModel>> getGuideItineraries() async {
    throw UnsupportedError("");
  }

  Future<List<ItinerarySpotModel>> getItinerarySpots() async {
    throw UnsupportedError("");
  }

  Future<void> createSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  Future<List<SpotModel>> searchSpots(searchText) async {
    throw UnsupportedError("");
  }

  Future<List<ItineraryModel>> searchItineraries(searchText) async {
    throw UnsupportedError("");
  }
}
