import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SpotImagesSlider extends StatelessWidget {
  final List<Image> spotImagesList;

  const SpotImagesSlider({Key? key, required this.spotImagesList})
      : super(key: key);
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
      items: spotImagesList
          .map((item) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: item.image, fit: BoxFit.cover)),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
