import 'package:flutter/material.dart';

Widget descGuia() => Container(
      width: 328,
      height: 219.76,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 328,
                height: 151,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0x2dffffff),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 16.35,
                      top: 15,
                      child: SizedBox(
                        width: 63.20,
                        child: Text(
                          "Descrição",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 186.34,
                      top: 8,
                      child: Container(
                        width: 131.85,
                        height: 29,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 131.85,
                              height: 29,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0x26ffffff),
                              ),
                              padding: const EdgeInsets.only(
                                left: 32,
                                right: 3,
                                top: 8,
                                bottom: 7,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 96.98,
                                    child: Text(
                                      "Visualizar Licença",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
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
                    Positioned(
                      left: 190.70,
                      top: 11,
                      child: Container(
                        width: 31.60,
                        height: 29,
                        child: Stack(
                          children: [
                            Container(
                              width: 31.60,
                              height: 29,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [],
                              ),
                            ),
                            Positioned(
                              left: 8,
                              top: 5,
                              child: Container(
                                width: 10.40,
                                height: 13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffffefef),
                                ),
                              ),
                            ),
                            Container(
                              width: 31.60,
                              height: 29,
                              padding: const EdgeInsets.only(
                                right: 4,
                                bottom: 6,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 27.24,
                                    height: 23,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 299.67,
                height: 175.46,
                child: Opacity(
                  opacity: 0.70,
                  child: Text(
                    "We hold ourselves to uncompromising ethical and legal standards. This extends to our day-to-day business conduct, our employee policies, and our environmental programs rights and social responsibility.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
