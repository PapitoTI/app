import 'package:flutter/material.dart';

Widget infoGuiaWidget() => Container(
      width: 328,
      height: 72,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 328,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0x2dffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 26,
                  top: 5,
                  child: Container(
                    width: 62,
                    height: 62,
                    child: FlutterLogo(size: 62),
                  ),
                ),
                Positioned(
                  left: 98,
                  top: 12,
                  child: Text(
                    "Fulano  de Tal           Guia",
                  ),
                ),
                Positioned(
                  left: 98,
                  top: 49,
                  child: Text(
                    "🌟 4.8 • 2 anos na plataforma",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
