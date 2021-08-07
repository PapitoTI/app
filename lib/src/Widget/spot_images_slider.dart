import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SpotImagesSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            height: 100,
            pauseAutoPlayOnManualNavigate: true,
            autoPlay: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayCurve: Curves.fastOutSlowIn),
        items: [
          Image.network(
              'https://jpimg.com.br/uploads/2021/02/eiffel-tower-3349075_1920-1024x682.jpg'),
          Image.network(
              'https://cdn2.civitatis.com/francia/paris/galeria/header/torre-eiffel-primavera.jpg'),
          Image.network(
              'https://s2.glbimg.com/FMg0m_W4Zb76bYy2oXTIGI7zb-4=/smart/e.glbimg.com/og/ed/f/original/2019/05/24/60485078_2144726185768804_8588803498087282106_n.jpg')
        ]);
  }
}
