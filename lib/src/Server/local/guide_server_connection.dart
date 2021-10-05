import 'dart:core';
import 'dart:io';

import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';
import 'package:flutter/material.dart';

TouristModel touristModel = TouristModel('assets/images/felipe_turista.jpg',
    'Turista Ferreira de Souza', 'fefsouza10@gmail.com', '+5511968638792');

GuideModel guideModel = GuideModel(
    'assets/images/felipe_guia.jpg',
    'Felipe Ferreira de Souza',
    'fefsouza10@gmail.com',
    '+5511968638792',
    'assets/images/certificado.jpg',
    '100,00'
        '');

SpotModel spotModel1 = SpotModel(
    'MASP',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/masp1.jpg',
      'assets/images/masp2.jpg',
      'assets/images/masp3.jpg'
    ],
    true);

SpotModel spotModel2 = SpotModel(
    'Parque Ibirapuera',
    'Avenida Paulista, São Paulo',
    'Monumento',
    'Museu de Arte de São Paulo Assis Chateaubriand (mais conhecido pelo acrônimo MASP) é uma das mais importantes instituições culturais brasileiras.[1] Localiza-se, desde 7 de novembro de 1968, na Avenida Paulista, cidade de São Paulo, em um edifício projetado pela arquiteta ítalo-brasileira Lina Bo Bardi para ser sua sede. Famoso pelo vão de mais de 70 metros que se estende sob quatro enormes pilares, concebido pelo engenheiro José Carlos de Figueiredo Ferraz,[2] o edifício é considerado um importante exemplar da arquitetura brutalista brasileira e um dos mais populares ícones da capital paulista, sendo tombado pelas três instâncias de proteção ao patrimônio: IPHAN, Condephaat e Conpresp.[3]',
    [
      'assets/images/ibirapuera1.jpg',
      'assets/images/ibirapuera2.jpg',
      'assets/images/ibirapuera3.jpg'
    ],
    true);

SpotModel spotModel3 = SpotModel(
    'Catedral da Sé',
    'Sé, São Paulo',
    'Monumento',
    'A Catedral da Sé é a igreja mais conhecida de São Paulo. Independente da religião a visita é imperdível.Com sua imponente construção marca também o centro da cidade, na Praça da Sé. A sua arquitetura é de brilhar os olhos! Cercada por vitrais, mosaicos e obras de arte sacra, possui capacidade para 8.000 pessoas, sendo considerada a maior da América do Sul.',
    [
      'assets/images/catedralse1.jpg',
      'assets/images/catedralse2.jpg',
      'assets/images/catedralse3.jpg'
    ],
    true);

List<SpotModel> spotList = [spotModel1, spotModel2, spotModel3];

var guidesDB = [
  {
    'imageUrl': 'assets/images/felipe_guia.jpg',
    'name': 'Felipe Ferreira de Souza',
    'email': 'fefsouza10@gmail.com',
    'phone': '+5511968638792',
    'certificate': 'assets/images/certificado.jpg',
    'accountBalance': '100,00'
  }
];

List<TimeOfDay> spotDuration = [
  TimeOfDay(hour: 2, minute: 30),
  TimeOfDay(hour: 3, minute: 45),
  TimeOfDay(hour: 1, minute: 15),
];

List<bool> weekdays = [false, true, true, true, true, true, false];

List<ExtraSpot> itineraryAddsList = [
  ExtraSpot('Serviço X', 'Faça isso e aproveite mais sua viagem!', 45.00),
  ExtraSpot('Serviço Y', 'Faça aquilo e aproveite mais sua viagem!', 20.00)
];

var itinerariesDB = [
  {
    'guideModel': guideModel,
    'name': 'Rolê no MASP',
    'spotsList': spotsDB,
    'spotDuration': spotDuration,
    'description':
        'Este roteiro passa por vários lugares de São Paulo, aproveite!',
    'category': 'Rolê',
    'weekdays': weekdays,
    'itineraryAddsList': itineraryAddsList,
    'price': 120.00
  }
];

DateTime dateItinerary = DateTime.utc(2021, 10, 11, 16, 00);

ItineraryModel itineraryModel1 = ItineraryModel(
    guideModel,
    'Rolê em SP',
    spotList,
    spotDuration,
    'Este roteiro passa por vários lugares de São Paulo, aproveite!',
    'Rolê',
    weekdays,
    itineraryAddsList,
    300.00,
    ItineraryType.Guide);

ScheduleModel scheduleModel1 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel2 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel3 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.approved);
ScheduleModel scheduleModel4 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.pending);
ScheduleModel scheduleModel5 = ScheduleModel(
    itineraryModel1, touristModel, dateItinerary, ScheduleStatus.pending);

List<ScheduleModel> scheduleList = [
  scheduleModel1,
  scheduleModel2,
  scheduleModel3,
  scheduleModel4,
  scheduleModel5
];

List<ItineraryModel> guideItinerariesList = [itineraryModel1];

class GuideServerConnection extends GuideServerConnectionInterface {
  // retornar dados do guia
  @override
  Future<GuideModel> getGuideData() async {
    GuideModel guideModel = GuideModel(
        'assets/images/felipe_guia.jpg',
        'Guia Ferreira de Souza',
        'fefsouza10@gmail.com',
        '+5511968638792',
        'assets/images/certificado.jpg',
        '100,00');

    return guideModel;
  }

  // trocar foto de perfil
  @override
  Future<void> updateProfilePicture(File file) async {
    throw UnsupportedError("");
  }

  // trocar senha
  @override
  Future<void> updateProfilePassword(
      String oldPassword, String newPassword) async {
    throw UnsupportedError("");
  }

  // criar roteiro
  @override
  Future<void> createItinerary(ItineraryModel itineraryModel) async {
    guideItinerariesList.add(itineraryModel);
  }

  //editar roteiro do guia
  @override
  Future<void> updateItinerary(ItineraryModel itineraryModel) async {
    print('alterado!');
  }

  // retornar lista de roteiros do guia
  @override
  Future<List<ItineraryModel>> getGuideItineraries() async {
    return guideItinerariesList;
  }

  // deletar roteiro do guia
  @override
  Future<void> deleteItinerary(ItineraryModel itineraryModel) async {
    throw UnsupportedError("");
  }

  // retornar lista de agendamentos do guia
  @override
  Future<List<ScheduleModel>> getSchedules() async {
    return scheduleList;
  }

  // aprovar o agendamento
  @override
  Future<void> approveSchedule(ScheduleModel scheduleModel) async {
    scheduleModel.scheduleStatus = ScheduleStatus.approved;
  }

  // cancelar o agendamento
  @override
  Future<void> cancelSchedule(ScheduleModel scheduleModel) async {
    scheduleModel.scheduleStatus = ScheduleStatus.denied;
  }
}
