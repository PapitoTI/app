import 'dart:io';

import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/create_itinerary/logic.dart';
import 'package:app/src/Pages/home_base/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardGCreatableWidget extends StatelessWidget {
  const CardGCreatableWidget(
      {Key? key,
      required this.spotName,
      required this.spotAddress,
      required this.spotImagesList,
      required this.index})
      : super(key: key);

  final spotName;
  final spotAddress;
  final spotImagesList;
  final index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBaseLogic>(builder: (home) {
      var img;
      if (spotImagesList.contains('assets'))
        img = home.session.getImage(spotImagesList);
      if (spotImagesList.contains('cache'))
        img = FileImage(File(spotImagesList));
      return Column(
        children: [
          if (spotImagesList.contains('assets'))
            Container(
              width: 250,
              height: 275,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: img.image, fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.cinzaClaroTransparente,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.beach_access),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Palette.branco,
                                    Palette.cinzaClaro
                                  ])),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      spotName,
                                      style: TextStyle(
                                          fontSize: 18, color: Palette.preto),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Palette.cinzaClaro,
                                      ),
                                      Expanded(
                                        child: Text(
                                          spotAddress,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Palette.cinzaClaro),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('2km',
                                            style: TextStyle(
                                                color: Palette.cinzaClaro)),
                                        GetBuilder<CreateItineraryLogic>(
                                            builder: (create) {
                                          return ElevatedButton(
                                              onPressed: (() => {
                                                    create.itineraryCreatable
                                                        .spotsList
                                                        .removeAt(index),
                                                    create.itineraryCreatable
                                                        .spotDuration
                                                        .removeAt(index),
                                                    create.update()
                                                  }),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Palette.branco),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          side: BorderSide(
                                                              color: Palette
                                                                  .cinzaClaro)))),
                                              child: Icon(
                                                Icons.delete,
                                                color: Palette.cinzaClaro,
                                                size: 26,
                                              ));
                                        })
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          if (spotImagesList.contains('cache'))
            Container(
              width: 250,
              height: 275,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: img, fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Palette.cinzaClaroTransparente,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.beach_access),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Palette.branco,
                                    Palette.cinzaClaro
                                  ])),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      spotName,
                                      style: TextStyle(
                                          fontSize: 18, color: Palette.preto),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Palette.cinzaClaro,
                                      ),
                                      Text(
                                        spotAddress,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Palette.cinzaClaro),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('2km',
                                            style: TextStyle(
                                                color: Palette.cinzaClaro)),
                                        GetBuilder<CreateItineraryLogic>(
                                            builder: (create) {
                                          return ElevatedButton(
                                              onPressed: (() => {
                                                    create.itineraryCreatable
                                                        .spotsList
                                                        .removeAt(index),
                                                    create.itineraryCreatable
                                                        .spotDuration
                                                        .removeAt(index),
                                                    create.update()
                                                  }),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Palette.branco),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          side: BorderSide(
                                                              color: Palette
                                                                  .cinzaClaro)))),
                                              child: Icon(
                                                Icons.delete,
                                                color: Palette.cinzaClaro,
                                                size: 26,
                                              ));
                                        })
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      );
    });
  }
}
