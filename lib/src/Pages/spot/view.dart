import 'dart:ui';

import 'package:app/src/Config/images.dart';
import 'package:app/src/Models/itinerary_model.dart';
import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Pages/SelfGuide/self_guide.dart';
import 'package:app/src/Pages/home_base/logic.dart';
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
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();

  SpotModel _spot = Get.arguments as SpotModel;
  var _filteredArray = [];

  void verAParada(List<ItineraryModel> listinha) {
    listinha.forEach((element) {
      element.spotsList.forEach((e) {
        if (e.name == _spot.name) {
          _filteredArray.add(element);
        }
      });
    });
  }

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
                  spotImagesList: _spot.spotImagesList
                      .map((e) => touristLogic.builder.getImage(e))
                      .toList(),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Conhe??a este destino',
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
                              onPressed: (() => Get.to(SelfGuide())),
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
                                  Text('Anfitri??o'),
                                ],
                              )),
                        ],
                      ),
                    ),
                    FutureBuilder<List<ItineraryModel>>(
                      // TODO: retornar diferentes ItineraryType
                      future: homeBaseLogic.session.getGuideItineraries(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          verAParada(snapshot.data!);
                          return Container(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _filteredArray.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GetBuilder<ItineraryLogic>(
                                      builder: (logic) {
                                    return GestureDetector(
                                      onTap: (() => {
                                            homeBaseLogic.itinerary =
                                                _filteredArray[index],
                                            logic.insertItinerary(
                                                _filteredArray[index]),
                                            Get.to(() => ItineraryPage(),
                                                arguments:
                                                    _filteredArray[index])
                                          }),
                                      child: CardPWidget(
                                        title: _filteredArray[index].name,
                                        description:
                                            '${_filteredArray[index].spotsList.length} locais',
                                        image: _filteredArray[index]
                                                .spotsList[0]
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
              ],
            ),
          ),
        ),
      ],
    ));
  }
//   @override
//   void dispose() {
//     Get.delete<SpotLogic>();
//     super.dispose();
//   }
}
