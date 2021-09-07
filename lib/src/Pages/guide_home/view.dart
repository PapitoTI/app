import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/schedule_model.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:app/src/Widget/card_g_widget.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:app/src/Widget/orion_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GuideHomePage extends StatefulWidget {
  @override
  _GuideHomePageState createState() => _GuideHomePageState();
}

class _GuideHomePageState extends State<GuideHomePage> {
  final GuideHomeLogic logic = Get.put(GuideHomeLogic());
  GuideServerConnection guideServerConnection = GuideServerConnection();
  var guide;
  var itinerariesList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GuideModel>(
        future: guideServerConnection.getGuideData(),
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
                            child: Image.asset(
                              'assets/images/orion.png',
                            ),
                          ),
                          Container(
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
                          Container(
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
                      future: guideServerConnection.getSchedules(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            width: 350,
                            height: 100,
                            child: ListView.builder(
                                itemCount: snapshot.data?.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  if (snapshot.data?[index].scheduleStatus ==
                                      ScheduleStatus.approved) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CardPWidget(
                                        title: snapshot
                                            .data?[index].itinerary.name,
                                        description:
                                            '${snapshot.data?[index].itinerary.spotsList.length} locais',
                                        image: snapshot.data?[index].itinerary
                                            .spotsList[0].spotImagesList[0],
                                      ),
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
                      future: guideServerConnection.getSchedules(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            width: 350,
                            height: 100,
                            child: ListView.builder(
                                itemCount: snapshot.data?.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  if (snapshot.data?[index].scheduleStatus ==
                                      ScheduleStatus.pending) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CardPWidget(
                                        title: snapshot
                                            .data?[index].itinerary.name,
                                        description:
                                            '${snapshot.data?[index].itinerary.spotsList.length} locais',
                                        image: snapshot.data?[index].itinerary
                                            .spotsList[0].spotImagesList[0],
                                      ),
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
                            child: OrionButtonWidget(
                              text: 'Mais',
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Meus roteiros',
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    FutureBuilder<List<ItineraryModel>>(
                        future: guideServerConnection.getGuideItineraries(),
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
                                      child: CardGWidget(
                                        spotName: snapshot.data?[index].name,
                                        spotAddress:
                                            '${snapshot.data?[index].spotsList.length} locais',
                                        spotImagesList: snapshot.data?[index]
                                            .spotsList[0].spotImagesList[0],
                                        isFavorite: 'isFavorite',
                                      ),
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
