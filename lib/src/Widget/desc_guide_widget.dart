import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

Widget descGuiaWidget() => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.cinzaTransparente),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Quem sou eu?",
                    style: TextStyle(color: Palette.branco, fontSize: 20),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Palette.cinzaTransparente),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_copy,
                          color: Palette.branco,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Visualizar licença",
                            style:
                                TextStyle(color: Palette.branco, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 20.0),
            child: Text(
                "“Eu viajo não para ir a lugar algum, mas para ir. Eu viajo pelo propósito de viajar. A grande sedução é se mover.” (Robert Louis Stevenson)",
                style: TextStyle(color: Palette.branco)),
          ),
        ],
      ),
    );
