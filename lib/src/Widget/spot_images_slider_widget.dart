import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SpotImagesSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
            height: 150,
            viewportFraction: 0.4,
            pauseAutoPlayOnManualNavigate: true,
            autoPlay: true,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlayCurve: Curves.fastOutSlowIn),
        items: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/spot1.webp'),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/images/spot2.webp'),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/images/spot3.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
        ]);
  }
}
