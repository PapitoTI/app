import 'dart:ui';

import 'package:app/src/Models/favoritos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _pageController = PageController(viewportFraction: 0.877);

Widget card() => Container(
      height: 218.4,
      margin: EdgeInsets.only(top: 16),
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            favoritos.length,
            (int index) => Container(
                  margin: EdgeInsets.only(right: 28.8),
                  width: 200,
                  height: 470,
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
                                  SizedBox(width: 9.52),
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
                          color: Colors.white.withOpacity(.6),
                          //decoration: BorderRadius.circular(10),
                          height: 100,
                          width: 250,
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
