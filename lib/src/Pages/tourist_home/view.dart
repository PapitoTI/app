import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Models/tourist_model.dart';
import 'package:app/src/Pages/spot/view.dart';
import 'package:app/src/Server/local/tourist_server_connection.dart';
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
  final TouristHomeLogic logic = Get.put(TouristHomeLogic());
  TouristServerConnection touristServerConnection = TouristServerConnection();
  var tourist;
  var spotsList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TouristModel>(
      future: touristServerConnection.getTouristData(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        UserAvatarWidget(
                          height: 80,
                          width: 80,
                          image: tourist.imageUrl,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Boa noite, ${tourist.name.substring(0, idx).trim()}!',
                          style: TextStyle(fontSize: 26),
                        )),
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
                    future: touristServerConnection.getSpots(),
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
                                  child: GestureDetector(
                                    onTap: (() => {Get.to(SpotPage())}),
                                    child: CardGWidget(
                                        spotName: snapshot.data?[index].name,
                                        spotAddress:
                                            snapshot.data?[index].address,
                                        spotImagesList: snapshot
                                            .data?[index].spotImagesList[0],
                                        isFavorite:
                                            snapshot.data?[index].isFavorite),
                                  ),
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
                    future: touristServerConnection.getSpots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        spotsList = snapshot.data;
                        return Container(
                          width: 350,
                          height: 1000,
                          child: ListView.builder(
                              itemCount: snapshot.data?.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CardPWidget(
                                    title: spotsList[index].name,
                                    description: spotsList[index].address,
                                    image: spotsList[index].spotImagesList[0],
                                  ),
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
