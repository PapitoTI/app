import 'package:flutter/material.dart';

class TESTE extends StatefulWidget {
  @override
  _TESTEState createState() => _TESTEState();
}

class _TESTEState extends State<TESTE> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Color(0xff111417),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 375,
                height: 428,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Transform.rotate(
                      angle: -0.02,
                      child: Container(
                        width: double.infinity,
                        height: 872.76,
                        child: FlutterLogo(size: 872.7611083984375),
                      ),
                    ),
                    SizedBox(height: 303.62),
                    Container(
                      width: double.infinity,
                      height: 1118,
                      child: FlutterLogo(size: 724),
                    ),
                    SizedBox(height: 303.62),
                    /*Container(
                      width: 375,
                      height: 428,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xfff3f8f9), Color(0x56f3f8f9)],
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Opacity(
                opacity: 0.60,
                child: Container(
                  width: 375,
                  height: 829,
                  color: Colors.black,
                  padding: const EdgeInsets.only(
                    bottom: 11,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 564,
                        height: double.infinity,
                        child: FlutterLogo(size: 564),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 116,
            child: SizedBox(
              width: 325,
              child: Text(
                "Boa tarde, Fulano!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 286,
            child: Container(
              width: 375,
              height: 357,
              /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x00000000), Colors.black],
              ),*/
              padding: const EdgeInsets.only(
                left: 24,
                right: 216,
                top: 262,
                bottom: 69,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Locais Próximos",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 61,
            top: 229,
            child: Container(
              width: 61,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x00c4c4c4),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 169,
            child: Container(
              width: 327,
              height: 47,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 327,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0x3dffffff),
                    ),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 16,
                      top: 16,
                      bottom: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Search places...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 190),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 305,
            top: 38,
            child: Container(
              width: 46,
              height: 53,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Opacity(
                        opacity: 0.80,
                        child: Container(
                          width: 42,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 37),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: FlutterLogo(size: 46),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 143,
            top: 38,
            child: Container(
              width: 89,
              height: 44,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 89,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0x3dffffff),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [],
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 18,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Color(0xff5e5e5e),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 35,
                          top: 14,
                          child: Text(
                            "Agenda",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
            left: 24,
            top: 237,
            child: Text(
              "Destinos Favoritos",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 273,
            child: Container(
              width: 209,
              height: 254,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 209,
                        height: 248,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xfff3f2f9),
                        ),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 8,
                          top: 8,
                          bottom: 14,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 64,
                              height: 29,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 64,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0x19000000),
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      bottom: 7,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Opacity(
                                          opacity: 0.50,
                                          child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: FlutterLogo(size: 14),
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "Parks",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.60),
                            Container(
                              width: 189,
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [Color(0x70ffffff), Colors.white],
                                ),
                              ),
                            ),
                            SizedBox(height: 2.60),
                            Text(
                              "Lincoln Park",
                              style: TextStyle(
                                color: Color(0xff111417),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.60),
                            Container(
                              width: 154,
                              height: 17,
                              child: Stack(
                                children: [
                                  Opacity(
                                    opacity: 0.70,
                                    child: Text(
                                      "34 West 57th Street, PH",
                                      style: TextStyle(
                                        color: Color(0xff111417),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.60),
                            Container(
                              width: 59,
                              height: 29,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 59,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      right: 11,
                                      top: 6,
                                      bottom: 5,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Detail",
                                          style: TextStyle(
                                            color: Color(0x99474747),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.60),
                            Opacity(
                              opacity: 0.50,
                              child: Text(
                                "9.8 mi",
                                style: TextStyle(
                                  color: Color(0xff111417),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 209,
                    height: 254,
                    child: Stack(
                      children: [
                        Container(
                          width: 209,
                          height: 254,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.white,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 464,
                              height: 309,
                              child: FlutterLogo(size: 309),
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
            left: 249,
            top: 273,
            child: Container(
              width: 209,
              height: 254,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 209,
                        height: 248,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xfff3f9fa),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 189,
                                  height: 104,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0x0fffffff),
                                        Color(0x33ffffff)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 189,
                                  height: 104,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [Color(0x70ffffff), Colors.white],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 130,
                              top: 205,
                              child: Container(
                                width: 59,
                                height: 29,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 59,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xffdef2f8),
                                      ),
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                        right: 11,
                                        top: 6,
                                        bottom: 5,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Detail",
                                            style: TextStyle(
                                              color: Color(0xff5640e3),
                                              fontSize: 14,
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
                              left: 21,
                              top: 220,
                              child: Opacity(
                                opacity: 0.50,
                                child: Text(
                                  "6.2 mi",
                                  style: TextStyle(
                                    color: Color(0xff111417),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 174,
                              child: Container(
                                width: 152,
                                height: 17,
                                child: Stack(
                                  children: [
                                    Opacity(
                                      opacity: 0.70,
                                      child: Text(
                                        "11 North 35th Street, NY",
                                        style: TextStyle(
                                          color: Color(0xff111417),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 21,
                              top: 150,
                              child: Text(
                                "Rest & Beef",
                                style: TextStyle(
                                  color: Color(0xff111417),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 139,
                              top: 8,
                              child: Container(
                                width: 62,
                                height: 29,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 62,
                                      height: 29,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0x19000000),
                                      ),
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 9,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 10.72,
                                            height: 14,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 4.32,
                                                  height: 14,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(width: 1.04),
                                                Container(
                                                  width: 5.36,
                                                  height: 14,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 5.28),
                                          Text(
                                            "Food",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
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
                  Container(
                    width: 209,
                    height: 254,
                    child: Stack(
                      children: [
                        Container(
                          width: 209,
                          height: 254,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.white,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 288,
                              height: 384,
                              child: FlutterLogo(size: 288),
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
            left: 27,
            top: 588,
            child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
            ),
          ),
          Positioned(
            left: 27,
            top: 685,
            child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 375,
                height: 54,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 375,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x2dffffff),
                      ),
                      padding: const EdgeInsets.only(
                        left: 92,
                        right: 97,
                        top: 9,
                        bottom: 3,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 32,
                            child: Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.80),
                          Container(
                            width: 25,
                            height: 23,
                            child: FlutterLogo(size: 23),
                          ),
                          SizedBox(width: 4.80),
                          SizedBox(
                            width: 26,
                            child: Text(
                              "Chat",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.80),
                          Container(
                            width: 25,
                            height: 25,
                            child: FlutterLogo(size: 25),
                          ),
                          SizedBox(width: 4.80),
                          SizedBox(
                            width: 28,
                            child: Text(
                              "Perfil",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.80),
                          Container(
                            width: 26,
                            height: 26,
                            child: FlutterLogo(size: 26),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 30,
            child: Container(
              width: 130,
              height: 41,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 41,
                        height: 41,
                        child: FlutterLogo(size: 41),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 29,
            top: 72,
            child: Text(
              "Orion",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
