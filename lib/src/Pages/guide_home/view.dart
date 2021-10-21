import 'package:app/src/Config/images.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Pages/PerfilG/guide_profile.dart';
import 'package:app/src/Pages/calendar/view.dart';
import 'package:app/src/Pages/create_itinerary/view.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Pages/itinerary/view.dart';
import 'package:app/src/Pages/pending_schedules/view.dart';
import 'package:app/src/Pages/schedule/view.dart';
import 'package:app/src/Widget/card_g_widget.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:app/src/Widget/timeline_widget/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GuideHomePage extends StatefulWidget {
  @override
  _GuideHomePageState createState() => _GuideHomePageState();
}

class _GuideHomePageState extends State<GuideHomePage> {
  final GuideHomeLogic logic = Get.put(GuideHomeLogic());
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();
  var guide;
  var itinerariesList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GuideModel>(
        future: homeBaseLogic.session.getGuideData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            guide = snapshot.data;
            int? idx = guide.name.indexOf(" ");
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(ORION_LOGO),
                          ),
                          GestureDetector(
                            onTap: (() => {Get.to(() => CalendarPage())}),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Palette.cinzaClaroTransparente,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.calendar_today),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Agenda'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(
                              GuideProfile(),
                            ),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      guide.imageUrl,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Boa noite, ${guide.name.substring(0, idx).trim()}!',
                            style: TextStyle(fontSize: 26),
                          ),
                          OrionButtonWidget(
                            text: 'Carteira',
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Próximo compromisso:',
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    FutureBuilder<List<ScheduleModel>>(
                      future: homeBaseLogic.session.getSchedules(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            width: 350,
                            height: 100,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  if (snapshot.data?[index].scheduleStatus ==
                                      ScheduleStatus.approved) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GetBuilder<ItineraryLogic>(
                                          builder: (itinerary) {
                                        return GestureDetector(
                                          onTap: (() => {
                                                homeBaseLogic.itinerary =
                                                    snapshot
                                                        .data?[index].itinerary,
                                                itinerary.insertItinerary(
                                                    snapshot.data?[index]
                                                            .itinerary
                                                        as ItineraryModel),
                                                Get.to(() => SchedulePage(),
                                                    arguments:
                                                        snapshot.data?[index])
                                              }),
                                          child: CardPWidget(
                                            title: snapshot
                                                .data?[index].itinerary.name,
                                            description:
                                                '${snapshot.data?[index].itinerary.spotsList.length} locais',
                                            image: snapshot
                                                    .data?[index]
                                                    .itinerary
                                                    .spotsList[0]
                                                    .spotImagesList[0] ??
                                                '',
                                          ),
                                        );
                                      }),
                                    );
                                  } else {
                                    return Text('Sem compromissos agendados!');
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
                            'Solicitações pendentes:',
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    FutureBuilder<List<ScheduleModel>>(
                      future: homeBaseLogic.session.getSchedules(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var _filteredArray = snapshot.data
                              ?.where((element) =>
                                  element.scheduleStatus.toString() ==
                                  'ScheduleStatus.pending')
                              .toList();
                          return Container(
                            width: 350,
                            height: 100,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  if (_filteredArray!.length != 0) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GetBuilder<ItineraryLogic>(
                                          builder: (itinerary) {
                                        return GestureDetector(
                                          onTap: (() => {
                                                homeBaseLogic.itinerary =
                                                    _filteredArray[index]
                                                        .itinerary,
                                                Get.to(() => SchedulePage(),
                                                    arguments:
                                                        _filteredArray[index])
                                              }),
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
                                        );
                                      }),
                                    );
                                  } else {
                                    return Text('Sem compromissos pendentes!');
                                  }
                                }),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                            child: GestureDetector(
                              onTap: (() =>
                                  {Get.to(() => PendingSchedulesPage())}),
                              child: OrionButtonWidget(
                                text: 'Mais',
                              ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Meus roteiros',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: (() =>
                                {Get.to(() => CreateItineraryPage())}),
                            child: OrionButtonWidget(
                              text: 'Criar roteiro',
                            ),
                          )
                        ],
                      ),
                    ),
                    FutureBuilder<List<ItineraryModel>>(
                        future: homeBaseLogic.session.getGuideItineraries(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              width: 1000,
                              height: 300,
                              child: ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GetBuilder<HomeBaseLogic>(
                                          builder: (home) {
                                        return GetBuilder<ItineraryLogic>(
                                            builder: (itinerary) {
                                          return GetBuilder<
                                                  TimelineWidgetLogic>(
                                              builder: (timeline) {
                                            return GestureDetector(
                                              onTap: (() => {
                                                    itinerary.insertItinerary(
                                                        snapshot.data![index]),
                                                    Get.to(
                                                        () => ItineraryPage(),
                                                        arguments: snapshot
                                                            .data?[index])
                                                  }),
                                              child: CardGWidget(
                                                spotName:
                                                    snapshot.data?[index].name,
                                                spotAddress:
                                                    '${snapshot.data?[index].spotsList.length} locais',
                                                spotImagesList: snapshot
                                                    .data?[index]
                                                    .spotsList[0]
                                                    .spotImagesList[0],
                                                isFavorite: 'isFavorite',
                                              ),
                                            );
                                          });
                                        });
                                      }),
                                    );
                                  }),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        })
                  ],
                ),
              ),
            );
          } else {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Carregando...'),
                )
              ],
            ));
          }
        });
  }

  @override
  void dispose() {
    Get.delete<GuideHomeLogic>();
    super.dispose();
  }
}
