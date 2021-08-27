import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/itinerary_spot_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';

class TouristServerConnection extends TouristServerConnectionInterface {
  @override
  Future<void> createTourist(TouristModel touristModel) async {
    throw UnsupportedError("");
  }

  @override
  Future<TouristModel> getTouristData() async {
    throw UnsupportedError("");
  }

  @override
  Future<void> updateTouristData() async {
    throw UnsupportedError("");
  }

  @override
  Future<SpotModel> getSpotData() async {
    throw UnsupportedError("");
  }

  @override
  Future<List<SpotModel>> getFavorites() async {
    throw UnsupportedError("");
  }

  @override
  Future<ItineraryModel> getItineraryData() async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ItineraryModel>> getItinerariesByType(type) async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ItineraryModel>> getGuideItineraries() async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ItinerarySpotModel>> getItinerarySpots() async {
    throw UnsupportedError("");
  }

  @override
  Future<void> createSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  @override
  Future<List<SpotModel>> searchSpots(searchText) async {
    throw UnsupportedError("");
  }

  @override
  Future<List<ItineraryModel>> searchItineraries(searchText) async {
    throw UnsupportedError("");
  }
}
