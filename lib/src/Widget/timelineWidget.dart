import 'package:flutter/material.dart';

Widget timelineWidget() => Container(
      width: 259,
      height: 279,
      padding: const EdgeInsets.only(
        bottom: 67,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: 1.57,
            child: Container(
              width: 143,
              height: 1,
            ),
          ),
          SizedBox(height: 96.75),
          Container(
            width: 259,
            height: 279,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 259,
                  height: 279,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x2dffffff),
                  ),
                  padding: const EdgeInsets.only(
                    left: 164,
                    right: 62,
                    top: 63,
                    bottom: 204,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 33,
                        height: 12,
                        child: Opacity(
                          opacity: 0.60,
                          child: Text(
                            "1h30",
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
          SizedBox(height: 96.75),
          SizedBox(
            width: 84,
            height: 24,
            child: Text(
              "Timeline",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 96.75),
          Container(
            width: 192.63,
            height: 44,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.30),
                  ),
                  child: FlutterLogo(size: 44),
                ),
                SizedBox(width: 24.50),
                SizedBox(
                  width: 72,
                  height: 22,
                  child: Text(
                    "Torre Eiffel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 24.50),
                Container(
                  width: 23.63,
                  height: 21.36,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 23.63,
                        height: 21.36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x26000000),
                        ),
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 7,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Opacity(
                              opacity: 0.50,
                              child: Container(
                                width: 9,
                                height: 9.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterLogo(size: 9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 96.75),
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff242424),
            ),
          ),
          SizedBox(height: 96.75),
          Container(
            width: 192.63,
            height: 46.99,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 47.27,
                  height: 46.99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.30),
                  ),
                  child: FlutterLogo(size: 46.990291595458984),
                ),
                SizedBox(width: 6.11),
                SizedBox(
                  width: 70.90,
                  height: 23.50,
                  child: Text(
                    "Louvre",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 6.11),
                SizedBox(
                  width: 32.49,
                  height: 12.82,
                  child: Opacity(
                    opacity: 0.60,
                    child: Text(
                      "1h00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6.11),
                Container(
                  width: 23.63,
                  height: 21.36,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 23.63,
                        height: 21.36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x26000000),
                        ),
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Opacity(
                              opacity: 0.50,
                              child: Container(
                                width: 9,
                                height: 9.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FlutterLogo(size: 9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 96.75),
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff242424),
            ),
          ),
          SizedBox(height: 96.75),
          Container(
            width: 192.63,
            height: 46.99,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 47.27,
                  height: 46.99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.30),
                  ),
                  child: FlutterLogo(size: 46.990291595458984),
                ),
                SizedBox(width: 6.11),
                SizedBox(
                  width: 70.90,
                  height: 23.50,
                  child: Text(
                    "Aquário de Paris",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 6.11),
                SizedBox(
                  width: 32.49,
                  height: 12.82,
                  child: Opacity(
                    opacity: 0.60,
                    child: Text(
                      "30m",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6.11),
                Container(
                  width: 23.63,
                  height: 21.36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x26000000),
                  ),
                  padding: const EdgeInsets.only(
                    left: 7,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0.50,
                        child: Container(
                          width: 9,
                          height: 9.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 96.75),
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff242424),
            ),
          ),
        ],
      ),
    );
