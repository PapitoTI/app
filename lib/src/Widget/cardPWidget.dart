import 'package:flutter/material.dart';

Widget cardPWidget() => Container(
      width: 327,
      height: 84,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 327,
            height: 84,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0x3dffffff),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterLogo(size: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 92,
                  top: 45,
                  child: Opacity(
                    opacity: 0.60,
                    child: Text(
                      "231 East 95th Street, HK",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 113,
                  top: 20,
                  child: Text(
                    "Royal Albert Hotel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Positioned(
                  left: 92,
                  top: 24,
                  child: Container(
                    width: 15,
                    height: 11.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterLogo(size: 11.25),
                  ),
                ),
                Positioned(
                  left: 9,
                  top: 9,
                  child: Container(
                    width: 66,
                    height: 74,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 53,
                              height: 53,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: FlutterLogo(size: 53),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 66,
                              height: 66,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: FlutterLogo(size: 66),
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
    );
