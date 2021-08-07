import 'dart:ui';

import 'package:app/src/Config/Palette.dart';
import 'package:app/src/Models/favoritosModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _pageController = PageController(viewportFraction: 0.877);

Widget cardGWidget() => Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.6),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(favoritos[0].img ??
                'https://image.freepik.com/vetores-gratis/fundo-colorido-silhuetas-de-palmeiras_23-2148541792.jpg')),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 19.2,
            right: 19.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 19.2, sigmaX: 19.2),
                child: Container(
                  height: 36,
                  padding: EdgeInsets.only(left: 16.72, right: 14.4),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.umbrellaBeach,
                        color: Colors.white,
                      ),
                      SizedBox(width: 9),
                      Text(
                        favoritos[0].tipo ?? "Tipo",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                bottom: 19.2,
                left: 19.2,
                child: Container(
                  height: 120,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(.2)
                          ])),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              favoritos[0].nome ?? "Nome",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 12, 8, 0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 20,
                                color: Palette.cinza,
                              ),
                              Text(
                                favoritos[0].local ?? "Local",
                                style: TextStyle(
                                    color: Palette.cinza, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color: Palette.cinza,
                                    ),
                                    Text("2km"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 90),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.white60),
                                    elevation: MaterialStateProperty.all(10),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white.withOpacity(.6)),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    '+ Detalhes',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
