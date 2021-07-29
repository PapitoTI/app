import 'package:flutter/material.dart';

// Figma Flutter Generator Card1Widget - GROUP
Widget cardMWidget() => Container(
    width: 178,
    height: 159,
    child: Stack(children: <Widget>[
      Positioned(
          top: 8,
          left: 0,
          child: Container(
              width: 178,
              height: 142,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                color: Color.fromRGBO(243, 242, 249, 1),
              ))),
      Positioned(
          top: 0,
          left: 0,
          child: //Mask holder Template
              Container(width: 178, height: 159, child: null)),
      Positioned(
          top: 99,
          left: 3,
          child: Container(
              width: 171,
              height: 57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                gradient: LinearGradient(
                    begin: Alignment(-1.467097520828247, -0.3287612795829773),
                    end: Alignment(0.3287612795829773, -0.44422397017478943),
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.4399999976158142),
                      Color.fromRGBO(255, 255, 255, 1)
                    ]),
              ))),
      Positioned(
          top: 135,
          left: 17,
          child: Container(
              width: 52,
              height: 14,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 15,
                    child: Text(
                      '4 locais',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(17, 20, 23, 1),
                          fontFamily: 'Actor',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.5 /*PERCENT not supported*/
                          ),
                    )),
                Positioned(top: 0, left: 0, child: null),
              ]))),
      Positioned(
          top: 127,
          left: 113,
          child: Container(
              width: 50,
              height: 24.576271057128906,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 50,
                        height: 24.576271057128906,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ))),
                Positioned(
                    top: 4,
                    left: 5,
                    child: Text(
                      'Detalhes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                          fontFamily: 'Actor',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1.8),
                    )),
              ]))),
      Positioned(
          top: 103,
          left: 111,
          child: Text(
            '4h previstas',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(17, 20, 23, 1),
                fontFamily: 'Actor',
                fontSize: 10,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          )),
      Positioned(
          top: 101,
          left: 17,
          child: Text(
            'Roteiro X',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(17, 20, 23, 1),
                fontFamily: 'Actor',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.5 /*PERCENT not supported*/
                ),
          )),
      Positioned(
          top: 5,
          left: 110,
          child: Container(
              width: 64,
              height: 29,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 64,
                        height: 29,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        ))),
                Positioned(
                    top: 8,
                    left: 9,
                    child: Container(
                        width: 14,
                        height: 14,
                        child: Stack(children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Image.asset(
                              'assets/images/SP.jpg',
                            ),
                          ),
                          Positioned(
                            top: 9.8984375,
                            left: 0,
                            child: Image.asset(
                              'assets/images/SP.jpg',
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 5.8674774169921875,
                            child: Image.asset(
                              'assets/images/SP.jpg',
                            ),
                          ),
                        ]))),
                Positioned(
                    top: 8,
                    left: 27,
                    child: Text(
                      'Parks',
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
              ]))),
    ]));
