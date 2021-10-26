import 'package:app/src/Config/palette.dart';
import 'package:app/src/Models/spot_model.dart';
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
    String? spotName;
    String? spotAddress;
    String? spotCategory;
    String? spotDescription;
    List<String>? spotImagesList = [
      'assets/images/ibirapuera1.jpg',
      'assets/images/ibirapuera2.jpg',
      'assets/images/ibirapuera3.jpg',
      'assets/images/ibirapuera4.jpg',
      'assets/images/ibirapuera5.jpg'
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleWidget(text: 'Nome do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotName = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Endereço do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotAddress = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Categoria do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotCategory = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Descrição do destino:'),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.cinzaTransparente),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (title) {
                            spotDescription = title;
                          },
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              TitleWidget(text: 'Adicione fotos do destino:'),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ))),
                  onPressed: () => null,
                  child: Column(
                    children: [Text('Adicionar foto')],
                  )),
              Container(),
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
                            newSpot = SpotModel(
                                spotName!,
                                spotAddress!,
                                spotCategory!,
                                spotDescription!,
                                spotImagesList),
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
