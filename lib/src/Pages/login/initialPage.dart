import 'dart:ui';

import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Ceu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(36, 117, 252, 20), BlendMode.colorBurn)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/LogoR.png"),
                    alignment: Alignment.topLeft,
                    scale: 4,
                  ),
                ),
              ),

              ///slideTransition
              ListView(
                scrollDirection: Axis.horizontal,
                cacheExtent: 10,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.18)),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 90, left: 25, bottom: 60, right: 15),
                    width: 300,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.18)),
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.only(top: 90, bottom: 60, right: 15),
                    width: 300,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.18)),
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.only(top: 90, bottom: 60, right: 15),
                    width: 300,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.18)),
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.only(top: 90, bottom: 60, right: 15),
                    width: 300,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
