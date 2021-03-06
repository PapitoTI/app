import 'dart:io';

import 'package:app/src/Generated/Protos/common.pb.dart';
import 'package:app/src/Generated/Protos/guide.pbgrpc.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Server/Grpc/extensions.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../guide_server_connection_interface.dart';

class GrpcGuideServerConnection extends GuideServerConnectionInterface {
  final GuideServiceClient _client;
  final CallOptions _callOptions;

  GrpcGuideServerConnection(this._client, userName, cookie)
      : _callOptions = CallOptions(
            metadata: {"userName": userName, "cookie": cookie},
            timeout: Duration(seconds: 50));

  // retornar dados do guia
  @override
  Future<GuideModel> getGuideData() async {
    var info = await _client.information(Empty(), options: _callOptions);
    return GuideModel(info.profileImageUrl, info.name, info.email, info.phone,
        info.certificate, info.accountBalance.toString());
  }

  @override
  Image getImage(String url) {
    assert(!url.isEmpty);
    return Image.network(url);
  }

  // trocar foto de perfil
  @override
  Future<String> updateProfilePicture(File file) async {
    var bytes = await file.readAsBytes();
    var result = await _client.updatePicture(
        UpdatePictureRequest(imageBytes: bytes),
        options: _callOptions);
    return result.pictureUrl;
  }

  // trocar senha
  @override
  Future<void> updateProfilePassword(
      String oldPassword, String newPassword) async {
    await _client.updatePassword(
        UpdatePasswordRequest(
            oldPassword: oldPassword, newPassword: newPassword),
        options: _callOptions);
  }

  // criar roteiro
  @override
  Future<void> createItinerary(ItineraryModel it) async {
    await _client.createTour(
        Tour(
            name: it.name,
            category: it.category,
            description: it.description,
            durationsInSeconds: it.spotDuration.map((e) => e.inSeconds),
            // extraSpots: it.itineraryAddsList.map((e) => ExtraSpot()),
            price: it.price,
            spots: it.spotsList.map((e) => new Spot(
                description: e.description,
                category: e.category,
                name: e.name,
                address: e.address,
                imageUrls: e.spotImagesList)),
            weekdays: it.weekdays),
        options: _callOptions);
  }

  // retornar lista de roteiros do guia
  @override
  Future<List<ItineraryModel>> getGuideItineraries() async {
    var tours = await _client.tours(Empty(), options: _callOptions);
    return tours.tours.map((e) => e.toModel()).toList();
  }

  // deletar roteir0o do guia
  @override
  Future<void> deleteItinerary(ItineraryModel it) async {
    await _client.removeTour(RemoveTourRequest(tourName: it.name),
        options: _callOptions);
  }

  // retornar lista de agendamentos do guia
  @override
  Future<List<ScheduleModel>> getSchedules() async {
    var res = await _client.listSchedules(Empty(), options: _callOptions);
    return res.schedules.map((e) => e.toModel()).toList();
  }

  // aprovar o agendamento
  @override
  Future<void> approveSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }

  // cancelar o agendamento
  @override
  Future<void> cancelSchedule(ScheduleModel scheduleModel) async {
    throw UnsupportedError("");
  }
}
