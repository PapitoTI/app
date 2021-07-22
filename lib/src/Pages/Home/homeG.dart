import 'dart:ui';

import 'package:app/src/Widget/cardM.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeTurista1 extends StatefulWidget {
  @override
  _HomeTuristaState createState() => _HomeTuristaState();
}

class _HomeTuristaState extends State<HomeTurista1> {
  final _pageController = PageController(viewportFraction: 0.877);
  _onPressed() {
    Get.snackbar("Clicou", "Clicou na agenda");
  }

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
                            Padding(
                              padding: const EdgeInsets.only(left: 80),
                              child: Container(
                                height: 46,
                                width: 159,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey.withOpacity(0.3)),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  title: Text(
                                    "Minha agenda",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  onTap: () {
                                    _onPressed();
                                  },
                                ),
                              ),
                            ),
                            Container(
                                height: 46,
                                width: 46,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey,
                                ),
                                child: Icon(Icons.add_alert)),
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
                      card(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
