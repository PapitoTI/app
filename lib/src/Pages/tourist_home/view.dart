import 'package:app/src/Config/images.dart';
import 'package:app/src/Config/mock.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/destiny_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/search_page/search_page.dart';
import 'package:app/src/Pages/spot/view.dart';
import 'package:app/src/Pages/tourist_schedule/view.dart';
import 'package:app/src/Server/tourist_server_connection_interface.dart';
import 'package:app/src/Widget/card_g_widget.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:app/src/Widget/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TouristHomePage extends StatefulWidget {
  @override
  _TouristHomePageState createState() => _TouristHomePageState();
}

class _TouristHomePageState extends State<TouristHomePage> {
  final TouristHomeLogic logic = Get.put(TouristHomeLogic(_builder));
  var tourist;
  var spotsList;

  static TouristServerConnectionInterface _builder = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final List<Destiny> destiny = [
      Destiny(spotListAll[0].name, spotListAll[0].spotImagesList[0],
          spotListAll[0].address),
      Destiny(spotListAll[1].name, spotListAll[1].spotImagesList[0],
          spotListAll[1].address),
      Destiny(spotListAll[2].name, spotListAll[2].spotImagesList[0],
          spotListAll[2].address),
      Destiny(spotListAll[3].name, spotListAll[3].spotImagesList[0],
          spotListAll[3].address),
      Destiny(spotListAll[4].name, spotListAll[4].spotImagesList[0],
          spotListAll[4].address),
      Destiny(spotListAll[5].name, spotListAll[5].spotImagesList[0],
          spotListAll[5].address),
      Destiny(spotListAll[6].name, spotListAll[6].spotImagesList[0],
          spotListAll[6].address),
      Destiny(spotListAll[7].name, spotListAll[7].spotImagesList[0],
          spotListAll[7].address),
      Destiny(spotListAll[8].name, spotListAll[8].spotImagesList[0],
          spotListAll[8].address),
      Destiny(spotListAll[9].name, spotListAll[9].spotImagesList[0],
          spotListAll[9].address),
      Destiny(spotListAll[10].name, spotListAll[10].spotImagesList[0],
          spotListAll[10].address),
      Destiny(spotListAll[11].name, spotListAll[11].spotImagesList[0],
          spotListAll[11].address),
    ];
    return FutureBuilder<TouristModel>(
      future: logic.getTouristData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          tourist = snapshot.data;
          int? idx = tourist.name.indexOf(" ");
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
                            ORION_LOGO,
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => {Get.to(() => TouristSchedulePage())}),
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
                        UserAvatarWidget(
                          height: 80,
                          width: 80,
                          image: _builder.getImage(tourist.imageUrl),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Boa noite, ${tourist.name}!',
                          style: TextStyle(fontSize: 26),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      showSearch(
                          context: context,
                          delegate: SearchPageDelegate(destiny));
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 347,
                      height: 47,
                      decoration: BoxDecoration(
                        color: Palette.cinzaTransparente,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Pesquisar...",
                          style: TextStyle(color: Palette.cinzaClaro),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Destinos Favoritos',
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  FutureBuilder<List<SpotModel>>(
                    future: logic.getSpots(),
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
                                    return GestureDetector(
                                      onTap: (() => {
                                            Get.to(() => SpotPage(),
                                                arguments:
                                                    snapshot.data?[index])
                                          }),
                                      child: CardGWidget(
                                        spotName: snapshot.data?[index].name,
                                        spotAddress:
                                            snapshot.data?[index].address,
                                        spotImagesList: snapshot
                                            .data?[index].spotImagesList[0],
                                      ),
                                    );
                                  }),
                                );
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
                          'Pontos Turísticos Próximos',
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  FutureBuilder<List<SpotModel>>(
                    future: logic.getSpots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        spotsList = snapshot.data;
                        return Container(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GetBuilder<HomeBaseLogic>(
                                      builder: (home) {
                                    return GestureDetector(
                                      onTap: (() => {
                                            Get.to(() => SpotPage(),
                                                arguments:
                                                    snapshot.data?[index])
                                          }),
                                      child: CardPWidget(
                                        title: spotsList[index].name,
                                        description: spotsList[index].address,
                                        image:
                                            spotsList[index].spotImagesList[0],
                                      ),
                                    );
                                  }),
                                );
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
      },
    );
  }

  @override
  void dispose() {
    Get.delete<TouristHomeLogic>();
    super.dispose();
  }
}
