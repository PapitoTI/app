import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Pages/schedule/view.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:app/src/Widget/tourist_schedule_card_p_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class TouristSchedulePage extends StatelessWidget {
  final logic = Get.put(TouristScheduleLogic());
  final state = Get.find<TouristScheduleLogic>().state;
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return FutureBuilder<TouristModel>(
        future: home.session.getTouristData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var tourist = snapshot.data;
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BackButtonWidget(title: 'Agenda'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Agendados:',
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      FutureBuilder<List<ScheduleModel>>(
                        future: homeBaseLogic.session.getSchedules(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data
                                      ?.where((element) =>
                                          element.scheduleStatus.toString() ==
                                              'ScheduleStatus.approved' &&
                                          element.touristModel.name
                                                  .toString() ==
                                              tourist?.name &&
                                          DateTime.now()
                                              .toUtc()
                                              .isBefore(element.date))
                                      .toList()
                                      .length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    var _filteredArray = snapshot.data
                                        ?.where((element) =>
                                            element.scheduleStatus.toString() ==
                                                'ScheduleStatus.approved' &&
                                            element.touristModel.name
                                                    .toString() ==
                                                tourist?.name &&
                                            DateTime.now()
                                                .toUtc()
                                                .isBefore(element.date))
                                        .toList();
                                    if (!(_filteredArray!.length == 0)) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GetBuilder<ItineraryLogic>(
                                                builder: (itinerary) {
                                              return GestureDetector(
                                                onTap: (() => {
                                                      itinerary.insertItinerary(
                                                          _filteredArray[index]
                                                              .itinerary),
                                                      Get.to(
                                                          () => SchedulePage(),
                                                          arguments:
                                                              _filteredArray[
                                                                  index])
                                                    }),
                                                child:
                                                    TouristScheduleCardPWidget(
                                                  title: _filteredArray[index]
                                                      .itinerary
                                                      .name,
                                                  description:
                                                      _filteredArray[index]
                                                          .scheduleStatus
                                                          .toString(),
                                                  image: _filteredArray[index]
                                                      .itinerary
                                                      .spotsList[0]
                                                      .spotImagesList[0],
                                                  date: DateFormat('dd/MM/yyyy')
                                                      .format(
                                                          _filteredArray[index]
                                                              .date),
                                                ),
                                              );
                                            }),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Text(
                                          'Sem compromissos pendentes!');
                                    }
                                  }),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Histórico:',
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                      FutureBuilder<List<ScheduleModel>>(
                        future: homeBaseLogic.session.getSchedules(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data
                                      ?.where((element) =>
                                          element.scheduleStatus.toString() ==
                                              'ScheduleStatus.approved' &&
                                          element.touristModel.name
                                                  .toString() ==
                                              tourist?.name &&
                                          DateTime.now()
                                              .toUtc()
                                              .isAfter(element.date))
                                      .toList()
                                      .length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    var _filteredArray = snapshot.data
                                        ?.where((element) =>
                                            element.scheduleStatus.toString() ==
                                                'ScheduleStatus.approved' &&
                                            element.touristModel.name
                                                    .toString() ==
                                                tourist?.name &&
                                            DateTime.now()
                                                .toUtc()
                                                .isAfter(element.date))
                                        .toList();
                                    if (!(_filteredArray!.length == 0)) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CardPWidget(
                                              title: _filteredArray[index]
                                                  .itinerary
                                                  .name,
                                              description:
                                                  '${_filteredArray[index].itinerary.spotsList.length} locais',
                                              image: _filteredArray[index]
                                                  .itinerary
                                                  .spotsList[0]
                                                  .spotImagesList[0],
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Text(
                                          'Sem compromissos pendentes!');
                                    }
                                  }),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    });
  }
}
