import 'package:app/src/Config/palette.dart';
import 'package:app/src/Server/local/guide_server_connection.dart';
import 'package:flutter/material.dart';

Widget infoGuiaWidgetOld() => Container(
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
              color: Palette.cinzaTransparente,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 26,
                  top: 5,
                  child: Container(
                    width: 62,
                    height: 62,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(guideModel.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Positioned(
                    left: 98,
                    top: 12,
                    child: Text(
                      guideModel.name,
                      style: TextStyle(color: Palette.branco, fontSize: 20),
                    )),
                Positioned(
                  left: 98,
                  top: 49,
                  child: Text(
                    "🌟 4.8 • 2 anos na plataforma",
                    style: TextStyle(fontSize: 12, color: Palette.branco),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
