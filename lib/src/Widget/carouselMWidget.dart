import 'package:app/src/Models/favoritosModel.dart';
import 'package:app/src/Widget/cardGWidget.dart';
import 'package:flutter/material.dart';

final _pageController = PageController(viewportFraction: 0.877);

Widget carouselMWidget() => Container(
      height: 300,
      margin: EdgeInsets.only(top: 16),
      child: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children:
              List.generate(favoritos.length, (int index) => cardGWidget())),
    );
