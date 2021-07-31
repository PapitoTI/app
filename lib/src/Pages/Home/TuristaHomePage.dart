import 'dart:ui';

import 'package:app/src/Widget/botaoAgendaWidget.dart';
import 'package:app/src/Widget/cardPWidget.dart';
import 'package:app/src/Widget/carouselMWidget.dart';
import 'package:app/src/Widget/hPerfilWidget.dart';
import 'package:app/src/Widget/navBarWidget.dart';
import 'package:flutter/material.dart';

class TuristaHomePage extends StatefulWidget {
  @override
  _TuristaHomePageState createState() => _TuristaHomePageState();
}

class _TuristaHomePageState extends State<TuristaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/SP.jpg",
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.7),
                child: SafeArea(
                  child: Container(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [botaoAgendaWidget(), hPerfilWidget()],
                          ),
                        ),
//teste pull

                        ///menu de cima
                        // Adicionar req do nome do usuario
                        Padding(
                          padding: EdgeInsets.only(top: 48, left: 28.8),
                          child: Text(
                            "Bem vindo, Fulano!",
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 48, left: 28.8),
                          child: Text(
                            "Favoritos!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        //carouselMWidget(),
                        cardPWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: navBarWidget());
  }
}
