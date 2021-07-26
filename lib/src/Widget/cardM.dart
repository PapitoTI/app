import 'dart:ui';

import 'package:app/src/Models/favoritos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _pageController = PageController(viewportFraction: 0.877);

Widget carouselM() => Container(
      height: 300,
      margin: EdgeInsets.only(top: 16),
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            favoritos.length,
            (int index) => Container(
                  margin: EdgeInsets.only(right: 18.8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.6),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(favoritos[index].img)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 19.2,
                        right: 19.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaY: 19.2, sigmaX: 19.2),
                            child: Container(
                              height: 36,
                              padding:
                                  EdgeInsets.only(left: 16.72, right: 14.4),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.umbrellaBeach,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 9),
                                  Text(
                                    favoritos[index].tipo,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 19.2,
                        left: 19.2,
                        child: Container(
                          height: 100,
                          width: 260,
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
                                Text(
                                  favoritos[index].nome,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.map_outlined),
                                    Text(
                                      favoritos[index].nome,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 22),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.timelapse),
                                    Text("4horas"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 90),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                          ),
                                          overlayColor:
                                              MaterialStateProperty.all(
                                                  Colors.white60),
                                          elevation:
                                              MaterialStateProperty.all(10),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white.withOpacity(.6)),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          '+ Detalhes',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
