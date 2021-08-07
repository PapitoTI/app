import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpotPageTitleWidget extends StatelessWidget {
  const SpotPageTitleWidget(
      {Key? key, required this.title, required this.categoria})
      : super(key: key);
  final String title;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Container(
          width: 327,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Color.fromRGBO(255, 255, 255, 0.18000000715255737),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Actor',
                      fontSize: 26,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                      ),
                ),
                Container(
                    width: 90,
                    height: 29,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 90,
                              height: 29,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Color.fromRGBO(
                                    255, 255, 255, 0.15000000596046448),
                              ))),
                      Positioned(
                          top: 8,
                          left: 11,
                          child: Container(
                              width: 16,
                              height: 12,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 16.000032424926758,
                                        height: 12,
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                width: 16.000032424926758,
                                                height: 12,
                                                child: Stack(children: <Widget>[
                                                  Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      child: Icon(
                                                          FontAwesomeIcons
                                                              .peopleArrows)),
                                                  Positioned(
                                                      top: 1.9999302625656128,
                                                      left: 3.3333566188812256,
                                                      child: Icon(
                                                          FontAwesomeIcons
                                                              .peopleArrows)),
                                                  Positioned(
                                                      top: 1.9999302625656128,
                                                      left: 8.000035285949707,
                                                      child: Icon(
                                                          FontAwesomeIcons
                                                              .peopleArrows)),
                                                ]),
                                              ))
                                        ]))),
                              ]))),
                      Positioned(
                          top: 8,
                          left: 33,
                          child: Text(
                            this.categoria,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Actor',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                                ),
                          )),
                    ]))
              ],
            ),
          )),
    );
  }
}
