import 'dart:ui';

import 'package:app/src/Config/images.dart';
import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/guide_model.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Pages/itinerary/logic.dart';
import 'package:app/src/Pages/itinerary/view.dart';
import 'package:app/src/Pages/tourist_home/logic.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:app/src/Widget/description_widget.dart';
import 'package:app/src/Widget/spot_images_slider_widget.dart';
import 'package:app/src/Widget/spot_page_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpotPage extends StatefulWidget {
  @override
  _SpotPageState createState() => _SpotPageState();
}

class _SpotPageState extends State<SpotPage> {
  final TouristHomeLogic touristLogic = Get.find<TouristHomeLogic>();
  final ItineraryLogic itineraryLogic = Get.put(ItineraryLogic());

  SpotModel _spot = Get.arguments as SpotModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(APP_WALLPAPER), fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(20, 20, 20, 100)),
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackButtonWidget(title: 'Destino'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SpotPageTitleWidget(
                      title: _spot.name, category: _spot.category),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: DescriptionWidget(description: _spot.description),
                ),
                SpotImagesSlider(
                  spotImagesList: _spot.spotImagesList.map((e) => touristLogic.builder.getImage(e)).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Conheça este destino',
                        style: TextStyle(fontSize: 16),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ))),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(Icons.map),
                              Text('Roteiro'),
                            ],
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ))),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              Text('Guia'),
                            ],
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ))),
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(Icons.emoji_people),
                              Text('Anfitrião'),
                            ],
                          )),
                    ],
                  ),
                ),
                FutureBuilder<List<ItineraryModel>>(
                  future:
                      touristLogic.getItinerariesByType(ItineraryType.Guide),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  GetBuilder<ItineraryLogic>(builder: (logic) {
                                return GestureDetector(
                                  onTap: (() => {
                                        logic.insertItinerary(
                                            snapshot.data![index]),
                                        Get.to(() => ItineraryPage(),
                                            arguments: snapshot.data?[index])
                                      }),
                                  child: CardPWidget(
                                    title: snapshot.data?[index].name,
                                    description:
                                        '${snapshot.data?[index].spotsList.length} locais',
                                    image: snapshot.data?[index].spotsList[0]
                                            .spotImagesList[0] ??
                                        '',
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget infoGuiaWidget(GuideModel guideModel) => Container(
    width: 328,
    height: 72,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 328,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Palette.cinzaTransparente,
          ),
          child: Stack(
            children: [
              Positioned(
                left: 26,
                top: 5,
                child: Container(
                  width: 62,
                  height: 62,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: touristLogic.builder.getImage(guideModel.imageUrl).image,
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                  left: 98,
                  top: 12,
                  child: Text(
                    guideModel.name,
                    style: TextStyle(color: Palette.branco, fontSize: 20),
                  )),
              Positioned(
                left: 98,
                top: 49,
                child: Text(
                  "🌟 4.8 • 2 anos na plataforma",
                  style: TextStyle(fontSize: 12, color: Palette.branco),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );


//   @override
//   void dispose() {
//     Get.delete<SpotLogic>();
//     super.dispose();
//   }
}
