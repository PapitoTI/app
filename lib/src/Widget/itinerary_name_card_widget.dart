import 'package:app/src/Config/palette.dart';
import 'package:flutter/material.dart';

Widget nomeRoteiroCardWidget() => Container(
      width: 327,
      height: 109,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Color.fromRGBO(255, 255, 255, 0.18000000715255737),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/SP.jpg'),
                            fit: BoxFit.fitWidth),
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Fulano  de Tal',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Actor',
                        fontSize: 16,
                        letterSpacing: -0.8747400641441345,
                        fontWeight: FontWeight.normal,
                        height: 1.5 /*PERCENT not supported*/
                        ),
                  ),
                  Text(
                    'Guia',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Actor',
                        fontSize: 16,
                        letterSpacing: -0.8747400641441345,
                        fontWeight: FontWeight.normal,
                        height: 1.5),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '🌟 4.8 • 2 anos na plataforma',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Palette.cinza,
                fontFamily: 'Roboto',
                fontSize: 12,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          )
        ],
      ),
    );
