import 'package:app/src/Widget/cardPWidget.dart';
import 'package:flutter/material.dart';

Widget timelineWidget() => Container(
      width: 259,
      height: 279,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0x25FFFFFF),
      ),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 2,
                      height: 60,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: Colors.white,
                    ),
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
