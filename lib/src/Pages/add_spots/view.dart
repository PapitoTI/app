import 'package:app/src/Models/spot_model.dart';
import 'package:app/src/Pages/create_itinerary/logic.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:app/src/Widget/back_button_widget.dart';
import 'package:app/src/Widget/card_p_widget.dart';
import 'package:app/src/Widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddSpotsPage extends StatefulWidget {
  @override
  _AddSpotsPageState createState() => _AddSpotsPageState();
}

class _AddSpotsPageState extends State<AddSpotsPage> {
  final logic = Get.put(AddSpotsLogic());
  final HomeBaseLogic homeBaseLogic = Get.find<HomeBaseLogic>();
  final CreateItineraryLogic createItineraryLogic =
      Get.find<CreateItineraryLogic>();
  var newSpot;
  var spotsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BackButtonWidget(title: 'Adicionar destino'),
              ),
              TitleWidget(
                  text: 'Selecione o destino que deseja adicionar ao roteiro:'),
              FutureBuilder<List<SpotModel>>(
                  future: homeBaseLogic.session.getSpots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      spotsList = snapshot.data;
                      return Container(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (() => {
                                      newSpot = snapshot.data?[index],
                                      createItineraryLogic
                                          .itineraryCreatable.spotsList
                                          .add(newSpot),
                                      createItineraryLogic
                                          .itineraryCreatable.spotDuration
                                          .add(Duration(hours: 0, minutes: 0)),
                                      createItineraryLogic.update(),
                                      Get.back()
                                    }),
                                child: CardPWidget(
                                  title: spotsList[index].name,
                                  description: spotsList[index].address,
                                  image: spotsList[index].spotImagesList[0],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              // Row(
              //   children: [
              //     ElevatedButton(
              //         style: ButtonStyle(
              //             shape:
              //                 MaterialStateProperty.all<RoundedRectangleBorder>(
              //                     RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ))),
              //         onPressed: () => Get.back(),
              //         child: Column(
              //           children: [Text('Cancelar')],
              //         )),
              //     ElevatedButton(
              //         style: ButtonStyle(
              //             shape:
              //                 MaterialStateProperty.all<RoundedRectangleBorder>(
              //                     RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20.0),
              //         ))),
              //         onPressed: (() => {
              //               // newSpot = SpotModel(
              //               //     spotName!,
              //               //     spotAddress!,
              //               //     spotCategory!,
              //               //     spotDescription!,
              //               //     spotImagesList),
              //             }),
              //         child: Column(
              //           children: [Text('Salvar')],
              //         )),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<AddSpotsLogic>();
    super.dispose();
  }
}
