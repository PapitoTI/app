import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Pages/spot/view.dart';
import 'package:app/src/Server/guide_server_connection_interface.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/card_g_widget.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:app/src/Widget/desc_guide_widget.dart';
import 'package:app/src/Widget/guide_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuideProfile extends StatefulWidget {
  const GuideProfile({Key? key}) : super(key: key);

  @override
  _GuideProfileState createState() => _GuideProfileState();
}

class _GuideProfileState extends State<GuideProfile> {
  var tourist;
  var spotsList;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Ceu.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(36, 117, 252, 20), BlendMode.modulate)),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [BackButtonWidget(title: "Perfil")],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                infoGuiaWidget(),
                SizedBox(
                  height: 10,
                ),
                descGuiaWidget(),
                SizedBox(height: 10),
                Text(
                  "Roteiros deste guia",
                  style: TextStyle(color: Palette.branco),
                ),
                SizedBox(height: 10),
                FutureBuilder<List<SpotModel>>(
                  future: home.session.getSpots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        width: 328,
                        height: 400,
                        child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
