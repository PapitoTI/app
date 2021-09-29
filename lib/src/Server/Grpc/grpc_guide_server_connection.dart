import 'dart:io';

import 'package:app/src/Generated/Protos/common.pb.dart';
import 'package:app/src/Generated/Protos/guide.pbgrpc.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:grpc/grpc.dart';

import '../guide_server_connection_interface.dart';

class GrpcGuideServerConnection extends GuideServerConnectionInterface {

  final GuideServiceClient _client;
  final CallOptions _callOptions;

  GrpcGuideServerConnection(this._client, userName, cookie) :
        _callOptions = CallOptions(metadata: { "userName": userName, "cookie": cookie }, timeout: Duration(seconds: 5));

  // retornar dados do guia
  @override
  Future<GuideModel> getGuideData() async {
    var info = await _client.information(GuideInformationRequest(), options: _callOptions);
    return GuideModel(info.profileImageUrl, info.name, info.email, info.phone, info.certificate, info.accountBalance.toString());
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

  // criar roteiro
  @override
  Future<void> createItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  // retornar lista de roteiros do guia
  @override
  Future<List<ItineraryModel>> getGuideItineraries() async {
    throw UnsupportedError("");
  }

  // deletar roteiro do guia
  @override
  Future<void> deleteItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  // retornar lista de agendamentos do guia
  @override
  Future<List<ScheduleModel>> getSchedules() async {
    throw UnsupportedError("");
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
