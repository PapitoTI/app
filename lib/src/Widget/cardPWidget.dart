import 'package:app/src/Models/favoritosModel.dart';
import 'package:flutter/material.dart';

final _pageController = PageController(viewportFraction: 0.877);

Widget cardPWidget() => Container(
      width: 327,
      height: 300,
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: List.generate(
          favoritos.length,
          (int index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 327,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0x2dffffff),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 285,
                      top: 42,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0x3dffffff),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 92,
                      top: 45,
                      child: Opacity(
                        opacity: 0.60,
                        child: Text(
                          "teste line 65",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 20,
                      child: Text(
                        "Teste line 77",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 9,
                      top: 9,
                      child: Container(
                        width: 66,
                        height: 66,
                        child: Stack(
                          children: [
                            Container(
                              child: Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.6),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white54,

                                          blurRadius: 10,

                                          // efeito fora da imagem sobra em x : y

                                          offset: Offset(0.0, 3.0),
                                        ),
                                      ],
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              favoritos[index].img)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 284,
                      top: 9,
                      child: Opacity(
                        opacity: 0.30,
                        child: Text(
                          "2.8 mi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
