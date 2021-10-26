import 'package:app/src/Pages/create_itinerary/logic.dart';
import 'package:app/src/Pages/home_base/logic.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget(text: 'Nome do destino:'),
              // ListView.builder(itemBuilder: itemBuilder)
              Row(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: () => Get.back(),
                      child: Column(
                        children: [Text('Cancelar')],
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                      onPressed: (() => {
                            // newSpot = SpotModel(
                            //     spotName!,
                            //     spotAddress!,
                            //     spotCategory!,
                            //     spotDescription!,
                            //     spotImagesList),
                            createItineraryLogic.itineraryCreatable.spotsList
                                .add(newSpot),
                            createItineraryLogic.itineraryCreatable.spotDuration
                                .add(Duration(hours: 0, minutes: 0)),
                            Get.back,
                            createItineraryLogic.update()
                          }),
                      child: Column(
                        children: [Text('Salvar')],
                      )),
                ],
              ),
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
