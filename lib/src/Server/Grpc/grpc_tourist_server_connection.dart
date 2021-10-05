import 'dart:io';

import 'package:app/src/Generated/Protos/common.pb.dart';
import 'package:app/src/Generated/Protos/tourist.pb.dart';
import 'package:app/src/Generated/Protos/tourist.pbgrpc.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:grpc/grpc.dart';

import '../tourist_server_connection_interface.dart';
import 'package:app/src/Models/guide_model.dart';

class GrpcTouristServerConnection extends TouristServerConnectionInterface {
  final TouristServiceClient _client;
  final CallOptions _callOptions;

  GrpcTouristServerConnection(this._client, userName, cookie) :
    _callOptions = CallOptions(metadata: { "userName": userName, "cookie": cookie }, timeout: Duration(seconds: 5));

  @override
  Future<TouristModel> getTouristData() async {
    var info = await _client.information(TouristInformationRequest(), options: _callOptions);
    return TouristModel(info.profileImageUrl, info.name, info.email, info.phone);
  }

  // trocar foto de perfil
  @override
  Future<String> updateProfilePicture(File file) async {
    var bytes = await file.readAsBytes();
    var result = await _client.updatePicture(UpdatePictureRequest(imageBytes: bytes), options: _callOptions);
    return result.pictureUrl;
  }

  // trocar senha
  @override
  Future<void> updateProfilePassword(String oldPassword, String newPassword) async {
    await _client.updatePassword(UpdatePasswordRequest(oldPassword: oldPassword, newPassword: newPassword), options: _callOptions);
  }

  // retornar lista dos destinos em alta
  @override
  Future<List<SpotModel>> getSpots() async {
    var result = await _client.hotSpots(HotSpotsRequest(), options: _callOptions);
    return result.spots.map((e) => SpotModel(e.name, e.address, e.category, e.description, e.imageUrls, false)).toList();
  }

  // retornar lista de roteiros por tipo de guiamento
  @override
  Future<List<ItineraryModel>> getItinerariesByType(ItineraryType itineraryType) async {
    throw UnsupportedError("");
  }

  // retornar lista de roteiros por guia
  @override
  Future<List<ItineraryModel>> getGuideItineraries(GuideModel guideModel) async {
    throw UnsupportedError("");
  }

  // criar novo roteiro
  @override
  Future<void> requestSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  // retonar lista de agendamentos do turista
  @override
  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
  }

  // retornar lista de pesquisa do usuário (destinos e roteiros)
  // retornar ItineraryModel e SpotModel
  @override
  Future<List<Object>> searchResults(List<String> categories, String searchText) async {
    throw UnsupportedError("");
  }

}
