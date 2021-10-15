import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

Widget descGuiaWidget() => Container(
      width: 328,
      height: 151,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.cinzaTransparente),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quem sou eu?",
                  style: TextStyle(color: Palette.branco),
                ),
                Container(
                  width: 132,
                  height: 29,
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
                        Text(
                          "Visualizar licença",
                          style: TextStyle(color: Palette.branco, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Text("Criar local para puxar a desc",
              style: TextStyle(color: Palette.branco)),
        ],
      ),
    );
