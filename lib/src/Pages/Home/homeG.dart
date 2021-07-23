import 'dart:ui';
import 'package:app/src/Widget/botaoAgenda.dart';
import 'package:app/src/Widget/cardM.dart';
import 'package:app/src/Widget/fPerfil.dart';
import 'package:app/src/Widget/navBar.dart';
import 'package:flutter/material.dart';

class HomeTurista1 extends StatefulWidget {
  @override
  _HomeTuristaState createState() => _HomeTuristaState();
}

class _HomeTuristaState extends State<HomeTurista1> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    Text("Chat"),
    Text("Home"),
    Text("Perfil"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "asset/SP.jpg",
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
                            children: [
                              agenda(),
                              hPerfil(),
                            ],
                          ),
                        ),

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
                        carouselM(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: nBar());
  }
}
